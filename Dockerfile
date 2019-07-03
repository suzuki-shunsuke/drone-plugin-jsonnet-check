FROM drone/cli:1.1.2-alpine
COPY entrypoint.sh /bin/
ENTRYPOINT sh /bin/entrypoint.sh
