FROM ubuntu:rolling

RUN useradd -m user
VOLUME /home/user
CMD ["lutris"]

RUN apt update

RUN apt install -y software-properties-common && apt clean -y

RUN add-apt-repository ppa:lutris-team/lutris

ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y lutris && apt clean -y

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y wine32 && apt clean -y
RUN apt install -y dxvk && apt clean -y
RUN apt install -y xterm && apt clean -y

ENV USER=user
USER user

CMD ["/usr/games/lutris"]

