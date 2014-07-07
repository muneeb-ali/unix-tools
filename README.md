UNIX
====

UNIX commands and HOW-TOs

We'll mostly be using Debian distribution in our examples. 

Hostname:
==

    vi /etc/hostname (and put the name there like linode0)

New user:
==
    adduser <username>
    deluser <username>

    #add to sudo
    adduser <username> sudo

Change sudo timeout:
==
    sudo visudo
    Defaults env_reset,timestamp_timeout=-1    (it's in minutes, -1 means never expire)

Color prompt:
==
    sudo apt-get install vim
    sudo vi /etc/vim/vimrc
    syntax on

Securing the server:
==

Follow [this tutorial from Linode](https://library.linode.com/securing-your-server)

Some helpful firewall rules. 
```
    #Limiting port by IP address:
    -A INPUT -p tcp --dport 5000 -s <ip_address> -j ACCEPT
    -A INPUT -p tcp --dport 5000 -j DROP

    #Limiting SSH by IP
    -A INPUT -p tcp -s 128.112.0.0/16 -m state --state NEW --dport 22 -j ACCEPT
```

To refresh iptables rules:
```
    sudo iptables-restore < /etc/iptables.firewall.rules
    sudo iptables -L
```

Installing packages:
==
    apt-cache search <package_name>
