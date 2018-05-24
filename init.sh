#!/bin/bash

yum install expect -y

ssh-keygen -f ~/.ssh/id_rsa -N ""

PASSWORD=guess
HOSTS=`seq -f "192.168.2.%g" 11 25`

for ip in $HOSTS; do 
  ./ssh-copy-id.exp $ip root $PASSWORD
done

#wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/parallel-ssh/pssh-2.3.1.tar.gz

tar -xzvf pssh-2.3.1.tar.gz
cd pssh-2.3.1
python setup.py install

# uages:
# pssh -i -H `seq -f "192.168.2.%g" 11 25` echo hi

