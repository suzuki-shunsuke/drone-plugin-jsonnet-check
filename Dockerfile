FROM drone/cli:1.2.4-alpine
COPY entrypoint.sh /bin/
ENTRYPOINT sh /bin/entrypoint.sh
