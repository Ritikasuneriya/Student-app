from flask import Flask, request, jsonify
import json

app = Flask(__name__)

@app.route('/')
def home():
    return "Backend is running 🚀"

@app.route('/register', methods=['POST'])
def register():
    data = request.form.to_dict()

    with open('data.json', 'a') as f:
        f.write(json.dumps(data) + "\n")

    return jsonify({"message": "You have successfully registered!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)