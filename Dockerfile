FROM nginx:alpine
LABEL org.opencontainers.image.source https://github.com/khampeep/IMC-TEST
COPY ./html /usr/share/nginx/html