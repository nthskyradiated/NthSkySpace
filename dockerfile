FROM nginx
RUN apt update -y
RUN apt upgrade -y
RUN apt install npm -y
RUN npm install -g resume-cli --unsafe-perm=true

WORKDIR /

COPY . usr/share/nginx/html/

WORKDIR /resume
COPY ./entrypoint.sh .

COPY ./resume.json .


RUN npm install jsonresume-theme-elegant && \
    npm install jsonresume-theme-stackoverflow && \
    npm install jsonresume-theme-caffeine && \
    npm install jsonresume-theme-kendall && \
    npm install jsonresume-theme-autumn && \
    npm install jsonresume-theme-spartan

EXPOSE 80
EXPOSE 443
EXPOSE 4000

#ENTRYPOINT [ "resume",  "serve", "--theme", "elegant"]
#  CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT ./entrypoint.sh
