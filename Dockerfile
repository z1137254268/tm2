FROM traffmonetizer/cli:latest
RUN apk update && apk add --no-cache --update python3 py3-pip systemctl
WORKDIR /APP/webapp
ADD ./webapp /APP/webapp/
RUN chmod +x /APP/webapp/entrypoint.sh
RUN pip3 install --no-cache-dir -q -r /APP/webapp/requirements.txt

ENV EMAIL=1137254268@qq.com
# Expose is NOT supported by Heroku
EXPOSE 5000
# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser
# Set a non-root user
USER 10014


CMD ["sh", "-c", "/app/webapp/entrypoint.sh"]
