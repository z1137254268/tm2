import os
import socket
import subprocess

from flask import Flask
from requests import get

app = Flask(__name__)


@app.route('/')
def hello():
    hostname = socket.gethostname()
    ip = get('https://api.ipify.org').text
    return f"Hello from: {ip} on: {hostname}."

if __name__ == '__main__':
    app.run(host='0.0.0.0')
