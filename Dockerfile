FROM drone/cli:1.2.1-alpine
COPY entrypoint.sh /bin/
ENTRYPOINT sh /bin/entrypoint.sh
