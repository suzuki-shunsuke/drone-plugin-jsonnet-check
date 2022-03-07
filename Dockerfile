FROM drone/cli:1.5.0-alpine
COPY entrypoint.sh /bin/
ENTRYPOINT sh /bin/entrypoint.sh
