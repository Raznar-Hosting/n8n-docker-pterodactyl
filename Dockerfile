FROM n8nio/n8n:stable

LABEL author="Yusta" maintainer="xabhista19@gmail.com"

USER root
RUN if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache tini; \
    elif command -v apt-get >/dev/null 2>&1; then \
        apt-get update && apt-get install -y tini; \
    else \
        echo "Unsupported package manager"; exit 1; \
    fi


COPY --chown=node:node ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


USER node
ENV USER=node HOME=/home/node
WORKDIR /home/node


STOPSIGNAL SIGINT
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]