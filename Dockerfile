FROM kartoza/postgis:11.0-2.5

ADD . /postgis-public

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev python-tk libncurses5-dev bash s3cmd jq git lftp

RUN pip install -r /postgis-public/requirements-marvin.txt