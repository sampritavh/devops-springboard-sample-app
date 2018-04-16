
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
# Add a dummy test path to simplify local testing
COPY mysite.template.tmp /etc/nginx/conf.d/default.conf 
CMD ["nginx", "-g", "daemon off;"]
#CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
