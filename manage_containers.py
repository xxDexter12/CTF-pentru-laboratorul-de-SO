from flask import Flask, request, jsonify
import docker
import random
import string

app = Flask(__name__)
client = docker.from_env()

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def cleanup_container(container_name):
    try:
        container = client.containers.get(container_name)
        if container:
            container.stop()
            container.remove()
            print(f"Container {container_name} stopped and removed")
        else:
            print(f"Container {container_name} not found")
    except Exception as e:
        print(f"Failed to stop container {container_name}: {str(e)}")

@app.route('/start_container', methods=['POST'])
def start_container():
    user_id = id_generator()
    container_name = f"user_{user_id}"
    port = request.json.get('port')
    
    try:
        # Cleanup pentru containerul anterior (dacă există)
        cleanup_container(container_name)

        # Pornirea unui nou container pentru utilizatorul curent
        container = client.containers.run(
            "linux_mint_ctf",
            detach=True,
            name=container_name,
            ports={'22/tcp': port}
        )
        response = {
            'message': f"Container started for user {user_id} on port {port}",
            'container_id': container.id,
            'port': port,
            'ssh_command': f"ssh ctfuser@localhost -p {port}"
        }
        return jsonify(response), 200
    except Exception as e:
        response = {
            'message': f"Failed to start container: {str(e)}"
        }
        return jsonify(response), 500

@app.route('/stop_container', methods=['POST'])
def stop_container():
    container_name = request.json.get('container_name')
    cleanup_container(container_name)
    response = {
        'message': f"Container {container_name} stopped and removed"
    }
    return jsonify(response), 200

@app.route('/list_containers', methods=['GET'])
def list_containers():
    containers = client.containers.list()
    container_list = [{'id': c.id, 'name': c.name, 'status': c.status} for c in containers]
    return jsonify(container_list), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
