#/bin/sh
sudo docker run --network=nfechainnetwork --name no2 --ip=192.168.0.8 -it -v /home/user/shared/:/root/shared nfechain_node2
