FROM ubuntu

RUN apt install curl
#RUN apk add --no-cache curl bash sudo

RUN curl -s https://install.zerotier.com |sudo bash
RUN nohup zerotier-one &
RUN zerotier-cli join "3efa5cb78a48dada"
ENV PATH="${PATH}:/home/amir/WebServer/"

RUN mkdir -p /home/amir
RUN mkdir /home/amir/WebServer 
RUN mkdir /home/amir/WebServer/Key
RUN mkdir /home/amir/WebServer/geo_ip


RUN curl 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' > /home/amir/WebServer/ngrok-v3-stable-linux-amd64.tgz
RUN tar -xvf '/home/amir/WebServer/ngrok-v3-stable-linux-amd64.tgz' -C '/home/amir/WebServer/'
RUN chmod +x /home/amir/WebServer/ngrok

#RUN mv /ngrok /home/amir/WebServer/ngrok
#RUN ./ngrok config add-authtoken xxxxxx
#CMD nohup ./ngrok http 443 &



COPY 'Pichi_Controller.tar.xz' '/home/amir/WebServer/Pichi_Controller.tar.xz'
RUN tar -xvf '/home/amir/WebServer/Pichi_Controller.tar.xz' -C '/home/amir/WebServer/'
COPY 'GeoLite2-Country.mmdb' '/home/amir/WebServer/geo_ip/GeoLite2-Country.mmdb'
RUN chmod +x '/home/amir/WebServer/Pichi_Controller'
ENTRYPOINT [ "./home/amir/WebServer/Pichi_Controller" ]
