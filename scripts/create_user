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
 
sudo useradd -d /home/$NEWUSER -s /bin/bash -m $NEWUSER

sudo mkdir /home/$NEWUSER/.ssh
sudo chmod 700 /home/$NEWUSER/.ssh 
sudo echo $USERPUBKEY | sudo tee --append /home/$NEWUSER/.ssh/authorized_keys > /dev/null
sudo chmod 600 /home/$NEWUSER/.ssh/authorized_keys 
sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh
