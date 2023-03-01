FROM alpine


CMD curl -s https://install.zerotier.com | sudo bash
RUN nohup zerotier-one &
CMD zerotier-cli join "3efa5cb78a48dada"


CMD mkdir /home/amir/WebServer 
CMD mkdir /home/amir/WebServer/Key
CMD mkdir /home/amir/WebServer/geo_ip
CMD tar -xvf Pichi_Controller.tar.xz
COPY 'Pichi_Controller' '/home/amir/WebServer/Pichi_Controller'
COPY 'GeoLite2-Country.mmdb' '/home/amir/WebServer/geo_ip/GeoLite2-Country.mmdb'
CMD chmod +x '/home/amir/WebServer/Pichi_Controller'
ENTRYPOINT [ "./home/amir/WebServer/Pichi_Controller" ]
