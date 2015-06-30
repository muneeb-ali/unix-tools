#creates a new user and copies the publickey for ssh access

NEWUSER=$1
USERPUBKEY=$2
 
if [ -z "$NEWUSER" ]; then
        echo "Username required"
        exit 1;
fi
 
if [ -z "$USERPUBKEY" ]; then
        echo "Public key required - Enclose argument in quotes!"
        exit 1;
fi
 
useradd -d /home/$NEWUSER -s /bin/bash -m $NEWUSER

mkdir /home/$NEWUSER/.ssh
chmod 700 /home/$NEWUSER/.ssh 
echo $USERPUBKEY | tee --append /home/$NEWUSER/.ssh/authorized_keys > /dev/null
chmod 600 /home/$NEWUSER/.ssh/authorized_keys 
chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh

adduser $NEWUSER sudo