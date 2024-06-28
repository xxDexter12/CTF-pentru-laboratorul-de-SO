import base64

def to_base85(input_str):
    base85_encoded = base64.b85encode(input_str.encode('utf-8'))
    return base85_encoded.decode('utf-8')

def main():
    with open("/home/ctfuser/passwords.txt", "w") as fp:
        for i in range(2000, 2025 + 1):
            word = f"atm{i}"
            base85_word = to_base85(word)
            fp.write(f"{base85_word}\n")

if __name__ == "__main__":
    main()