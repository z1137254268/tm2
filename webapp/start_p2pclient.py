import os
import subprocess

import requests
current_dir = os.path.dirname(os.path.abspath(__file__))

log_path = os.path.join(current_dir, "test.log")

#ip = requests.get('https://api.ipify.org').text

cmd = f'cd /app && ./Cli start accept --token ODfciTRBCq5icakcyTTwDpV+YnSuYozRaRFbkQUT5iI= >> {log_path} 2>&1 &'
# run cmd and wait for it to finish
out, err = subprocess.Popen(
    cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
print(out.decode('utf-8'))
print(err.decode('utf-8'))
