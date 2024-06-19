from flask import Flask, request, jsonify
import docker
import random
import string

app = Flask(_name_)
client = docker.from_env()

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

@app.route('/start_container', methods=['POST'])
def start_container():
    user_id = id_generator()
    container_name = f"user_{user_id}"
    port = request.json.get('port')
    
    try:
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
    container_id = request.json.get('container_id')
    try:
        container = client.containers.get(container_id)
        container.stop()
        container.remove()
        response = {
            'message': f"Container {container_id} stopped and removed"
        }
        return jsonify(response), 200
    except Exception as e:
        response = {
            'message': f"Failed to stop container: {str(e)}"
        }
        return jsonify(response), 500

@app.route('/list_containers', methods=['GET'])
def list_containers():
    containers = client.containers.list()
    container_list = [{'id': c.id, 'name': c.name, 'status': c.status} for c in containers]
    return jsonify(container_list), 200

if _name_ == '_main_':
    app.run(host='0.0.0.0', port=5000)