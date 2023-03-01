FROM ubuntu:20.04


CMD curl -s https://install.zerotier.com | sudo bash
CMD nohup zerotier-one &
CMD zerotier-cli join "3efa5cb78a48dada"

CMD mkdir -p /home/amir
CMD mkdir /home/amir/WebServer 
CMD mkdir /home/amir/WebServer/Key
CMD mkdir /home/amir/WebServer/geo_ip

COPY 'Pichi_Controller.tar.xz' '/home/amir/WebServer/Pichi_Controller.tar.xz'
CMD tar -xvf '/home/amir/WebServer/Pichi_Controller.tar.xz' -C '/home/amir/WebServer/'
COPY 'GeoLite2-Country.mmdb' '/home/amir/WebServer/geo_ip/GeoLite2-Country.mmdb'
CMD chmod +x '/home/amir/WebServer/Pichi_Controller'
ENTRYPOINT [ "./home/amir/WebServer/Pichi_Controller" ]
