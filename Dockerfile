FROM alpine


CMD curl -s https://install.zerotier.com | sudo bash
RUN nohup zerotier-one &
CMD zerotier-cli join "3efa5cb78a48dada"


CMD mkdir /home/amir/WebServer 
CMD mkdir /home/amir/WebServer/Key
CMD mkdir /home/amir/WebServer/geo_ip

COPY 'Pichi_Controller.tar.xz' '/home/amir/WebServer/Pichi_Controller.tar.xz'
CMD tar -xvf Pichi_Controller.tar.xz
COPY 'GeoLite2-Country.mmdb' '/home/amir/WebServer/geo_ip/GeoLite2-Country.mmdb'
CMD chmod +x '/home/amir/WebServer/Pichi_Controller'
ENTRYPOINT [ "./home/amir/WebServer/Pichi_Controller" ]
