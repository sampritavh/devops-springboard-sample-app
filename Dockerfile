
FROM nginx:alpine
ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"
RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

COPY index.html /usr/share/nginx/html/

COPY mysite.template /etc/nginx/conf.d
# Add a dummy test path to simplify local testing
ENV SERVICE_PATH testpath
ENV LINK_SERVER_NAME www.example.com
CMD /bin/sh -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
