FROM ruby:2.7.0

# Fix for yarn signed package
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# https://unix.stackexchange.com/questions/508724/failed-to-fetch-jessie-backports-repository
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y build-essential libpq-dev nodejs libgsl0-dev

RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y openssh-server yarn

RUN mkdir /allcollate
WORKDIR /allcollate

ENV RAILS_ENV production

ADD . /allcollate

RUN yarn install
RUN bundle install --without development test
RUN bin/webpack

EXPOSE 3000
CMD ["/bin/bash", "-c", "puma"]
