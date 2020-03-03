from flask import Flask, jsonify, request
app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = False
import os

@app.route('/')
def home():
    return 'Welcome to My Sample Application!'

@app.route('/Info')
def get_details():

     return jsonify({'service_name':app.name, 'version':os.environ['FLASK_APP_VERSION'], 'git_commit_sha': os.environ['FLASK_GIT_VERSION'], 'environment': {'service_port':os.environ['FLASK_RUN_PORT'], 'log_level': "INFO"}}),200


if __name__ == '__main__':
     app.run(host='0.0.0.0', port=8080)

