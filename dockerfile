FROM nginx:latest

WORKDIR /
COPY . usr/share/nginx/html/
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]