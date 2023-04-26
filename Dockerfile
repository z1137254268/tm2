FROM traffmonetizer/cli:latest
RUN apk update && apk add --no-cache --update python3 py3-pip
WORKDIR /root/webapp
ADD ./webapp /root/webapp/
RUN chmod +x /root/webapp/entrypoint.sh
RUN pip3 install --no-cache-dir -q -r /root/webapp/requirements.txt

ENV EMAIL=1137254268@qq.com
# Expose is NOT supported by Heroku
EXPOSE 5000
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku

RUN addgroup -gid 10014 choreo && \
    adduser --system --disabled-password --gecos "" --no-create-home --uid 10014 --gid 10014 choreouser

RUN chown 10014:10014 /root/webapp/entrypoint.sh

USER 10014

CMD ["sh", "-c"]

ENTRYPOINT ["./root/webapp/entrypoint.sh"]
