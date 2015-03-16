echo "Starting namecoind ..."
/srv/namecoin/src/namecoind --daemon &

while true;
do
    out=$(/srv/namecoin/src/namecoind getinfo)

    if [[ $out == *"block"* ]];
    then
        echo "Namecoind is live"
        break
    else
        echo "Namecoind is loading, wait ..."
        sleep 1
    fi
done

while true;
do
    out=$(/srv/namecoin/src/namecoind getinfo)

    if [[ $out == *"block"* ]];
    then
        echo "Namecoind is running without problems"
        sleep 30
    else
        echo "ERROR: Namecoind did not respond"
        sleep 1
    fi
done