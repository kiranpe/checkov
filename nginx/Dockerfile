FROM nginx:1.23

RUN apt-get update && apt-get autoclean && apt-get install gnupg software-properties-common -y && apt-get autoclean

#RUN groupadd -g 1099 nginx && useradd -u 1099 -g 1099 -d /home/nginx -m nginx

COPY --chown=nginx:nginx index.html /usr/share/nginx/html

RUN chown -R nginx:nginx /var/cache/nginx && chown -R nginx:nginx /var/log/nginx && chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && chown -R nginx:nginx /var/run/nginx.pid

USER nginx

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail http://localhost:8080 || exit 1