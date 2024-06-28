#!/bin/bash
echo "WAIT A SECOND"
touch /home/ctfuser/passwords.txt

cat << 'EOF' > /home/ctfuser/generate_base85.py
import base64

def to_base85(input_str):
    base85_encoded = base64.b85encode(input_str.encode('utf-8'))
    return base85_encoded.decode('utf-8')

def main():
    with open("/home/ctfuser/passwords.txt", "w") as fp:
        for i in range(2020, 2025):
            word = f"atm{i}"
            base85_word = to_base85(word)
            fp.write(f"{base85_word}\n")

if __name__ == "__main__":
    main()
EOF


python3 /home/ctfuser/generate_base85.py


echo 'flag{p4pus1_m4tr1osk4_russia}' > /tmp/flag.txt
sudo mv /home/ctfuser/challenge/script.py /tmp/

cd /tmp


zip -q --password "$(head -n 1 /home/ctfuser/passwords.txt)" "flag.zip" "flag.txt"


rm "flag.txt"


input_file="flag.zip"


tail -n +2 /home/ctfuser/passwords.txt | while read -r password; do
    zip -q --password "$password" "${input_file}.zip" "$input_file"
    rm "$input_file"
    input_file="${input_file}.zip"
done

mv /tmp/flag.zip* /tmp/flag.zip


mkdir -p /home/ctfuser/challenge
ln -s "/tmp/flag.zip" /home/ctfuser/.here
cd /home/ctfuser/challenge

rm -f /home/ctfuser/challenge/verificare_flag.c
rm /home/ctfuser/generate_base85.py
rm /home/ctfuser/challenge/Dockerfile
rm /home/ctfuser/passwords.txt
echo "Setup completed"
cd /home/ctfuser/challenge
rm /home/ctfuser/challenge/start.sh 

