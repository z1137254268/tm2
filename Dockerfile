FROM traffmonetizer/cli:v1.0.0

RUN apk update \
    && apk add --no-cache python3 py3-pip \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY ./webapp /app/webapp
RUN chmod +x /app/webapp/entrypoint.sh \
    && pip3 install --no-cache-dir -q -r /app/webapp/requirements.txt

ENV EMAIL=1137254268@qq.com

EXPOSE 5000
CMD ["sh", "-c", "/app/webapp/entrypoint.sh"]
