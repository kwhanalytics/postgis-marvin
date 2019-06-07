FROM mdillon/postgis:11

ADD . /postgis-public

RUN pip install -r /postgis-public/requirements-marvin.txt

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN apt-get install -y libncurses5-dev bash s3cmd
