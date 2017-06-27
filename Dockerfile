FROM mhart/alpine-node

ENV SLACK_CONFIG /etc/slack-irc/config.json

ADD config.json ${SLACK_CONFIG}

RUN npm install -g slack-irc

CMD sed -i 's/BOT_TOKEN_HERE/'${TOKEN}'/' ${SLACK_CONFIG} && \
        cat ${SLACK_CONFIG} && \
        slack-irc --config ${SLACK_CONFIG}
