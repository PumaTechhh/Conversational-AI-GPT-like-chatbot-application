from flask import Flask, render_template, request, jsonify
from models.chatbot_model import get_chatbot_response

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('chat.html')

@app.route('/get_response', methods=['POST'])
def get_response():
    user_message = request.json.get('message')
    response = get_chatbot_response(user_message)
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(debug=True)
