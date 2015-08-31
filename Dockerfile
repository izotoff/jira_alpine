FROM alpine
ENV JIRA_VERSION atlassian-jira-6.4.11
#RUN addgroup atlassian 
#RUN adduser -D atlassian1
#RUN addgroup atlassian1 atlassian
RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.2/main > /etc/apk/repositories
RUN apk add --update bash openssl openjdk7-jre-base && rm -rf /var/cache/apk/*
WORKDIR /var 
RUN wget -q -O - https://www.atlassian.com/software/jira/downloads/binary/${JIRA_VERSION}.tar.gz | tar -zvxf - && mv ${JIRA_VERSION}-standalone atlassian 

#RUN chown -R atlassian1 /var/atlassian/
RUN mkdir  /var/atlassian/jira

ENV JIRA_HOME /var/atlassian/jira

EXPOSE 8080
CMD /var/atlassian/bin/start-jira.sh -fg
