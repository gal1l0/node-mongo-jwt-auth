FROM public.ecr.aws/lts/ubuntu:20.04_stable
LABEL Author="Alain Christian(gal1l0)"

RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs

ADD package*.json /tmp/
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app

WORKDIR /opt/app
ADD . /opt/app
EXPOSE 3001

CMD ["npm", "run", "start"]