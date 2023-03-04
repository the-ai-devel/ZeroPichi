FROM alpine

RUN apk add --no-cache curl

#CMD curl -s https://install.zerotier.com | sudo bash
#CMD nohup zerotier-one &
#CMD zerotier-cli join "3efa5cb78a48dada"


CMD mkdir -p /home/amir
CMD mkdir /home/amir/WebServer 
CMD mkdir /home/amir/WebServer/Key
CMD mkdir /home/amir/WebServer/geo_ip


RUN curl 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' > ngrok-v3-stable-linux-amd64.tgz
RUN tar -xvf 'ngrok-v3-stable-linux-amd64.tgz'
RUN mv ngrok /home/amir/WebServer/ngrok
#RUN ./ngrok config add-authtoken xxxxxx
#CMD nohup ./ngrok http 443 &



COPY 'Pichi_Controller.tar.xz' '/home/amir/WebServer/Pichi_Controller.tar.xz'
RUN tar -xvf '/home/amir/WebServer/Pichi_Controller.tar.xz' -C '/home/amir/WebServer/'
COPY 'GeoLite2-Country.mmdb' '/home/amir/WebServer/geo_ip/GeoLite2-Country.mmdb'
RUN chmod +x '/home/amir/WebServer/Pichi_Controller'
ENTRYPOINT [ "./home/amir/WebServer/Pichi_Controller" ]
