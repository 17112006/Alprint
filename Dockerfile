FROM resin/armhf-alpine
MAINTAINER MastaaK

RUN addgroup -S user -g 3000 && \
adduser -S user user -u 3000 && \
addgroup user tty  && \
addgroup user dialout && \
apk update && \
  apk add --no-cache python yaml-dev py-setuptools && \
  apk add --no-cache --virtual .build &&\
  apk add git linux-headers gcc libc-dev python-dev py-setuptools python2 py-pip && \
git clone https://github.com/foosel/OctoPrint.git /home/user/octoprint && \
cd /home/user/octoprint && \
pip install --upgrade pip && \
pip install -r requirements.txt --no-cache-dir && \
python setup.py install && \
mkdir /home/user/.octoprint && \
chown -R user:user /home/user/.octoprint &&\
apk del .build && \
rm -rf /home/user/octoprint /root/.cache /var/cache/apk/* $0

USER user
EXPOSE 5000
ENTRYPOINT ["/usr/bin/octoprint"] 
# CMD /usr/bin/octoprint
