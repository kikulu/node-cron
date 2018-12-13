FROM mhart/alpine-node:10

WORKDIR /src
ADD . .

ENV TZ=Asia/Taipei

RUN apk update && apk add tzdata \
&& ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \ 
&& echo '$TZ' > /etc/timezone

CMD chown root:root /etc/crontabs/root && /usr/sbin/crond -f

