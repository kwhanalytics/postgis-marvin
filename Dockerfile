FROM kartoza/postgis:11.0-2.5

ADD . /postgis-public

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev libpq-dev python-dev python-pip python-tk python-magic libncurses5-dev bash jq git lftp curl virtualenv
RUN apt-get install -y --no-install-recommends apt-utils

RUN pip install -r /postgis-public/requirements-marvin.txt

RUN echo 'deb http://deb.debian.org/debian stretch main' > /etc/apt/sources.list.d/stretch_s3cmd.list
RUN apt-get update
RUN apt-get -t stretch install -y s3cmd chromedriver

# Fix for python-configparser https://bugs.launchpad.net/ubuntu/+source/configparser/+bug/1821247
RUN apt remove python-configparser
RUN pip install entrypoints
