import subprocess as sps
import os
from threading import Thread



host = "node{i}.social-n32-test.datacenter-soc-pg0.utah.cloudlab.us"
identity_file = ".ssh/cloudlab"



########### No Need To Change ###############

def logging(popen, hostname):
    with open(os.path.join('logs', hostname), 'w') as log:
        while popen.poll() is None:
            line = popen.stdout.readline()
            log.write(line)

if not os.path.exists('logs'):
    os.mkdir('logs')

with open("setup_worker.sh") as file:
    commands = file.read()

for i in range(17, 20):
    hostname = host.format(i=i)
    cmd_ssh = f"ssh {hostname} -i {identity_file} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    popen = sps.Popen(cmd_ssh.split(),
                    stdin=sps.PIPE, 
                    stdout = sps.PIPE,
                    universal_newlines=True,
                    bufsize=0)



    
        
    popen.stdin.write(commands)
    popen.stdin.close()

    logWriter = Thread(target=logging, args=[popen, hostname])
    logWriter.start()
    print(f"=============={hostname}============")


