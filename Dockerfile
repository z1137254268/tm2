FROM traffmonetizer/cli:v1.0.0

# 创建一个名为 appuser 的非根用户，使用 10001 作为用户 ID
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 11451

RUN apk update \
    && apk add --no-cache python3 py3-pip \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY ./webapp /app/webapp
RUN chmod +x /app/webapp/entrypoint.sh \
    && pip3 install --no-cache-dir -q -r /app/webapp/requirements.txt

ENV EMAIL=1137254268@qq.com

EXPOSE 5000

# 指定以 appuser 用户身份运行应用程序
USER appuser

CMD ["sh", "-c", "/app/webapp/entrypoint.sh"]
