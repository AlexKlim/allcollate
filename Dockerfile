FROM ruby:2.7.1-alpine3.10

# Fix for yarn signed package
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# # https://unix.stackexchange.com/questions/508724/failed-to-fetch-jessie-backports-repository
# RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
# RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
# RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y build-essential libpq-dev nodejs libgsl0-dev

# RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y --no-install-recommends apt-utils
# RUN apt-get install -y openssh-server yarn

RUN apk --no-cache add --update \
      openssh-server \
      yarn \
      build-base \
      postgresql-dev \
      libxml2-dev \
      tzdata \
      libxslt-dev && rm -rf /var/cache/apk/*

RUN mkdir -p /allcollate
WORKDIR /allcollate

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc

ENV RAILS_ENV production
ENV RAILS_MASTER_KEY 0a94c83c678fbc018b1a909a63f9c8ca
ADD . /allcollate

RUN yarn install
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install --without development test
RUN rake assets:precompile
RUN bin/webpack

EXPOSE 3000
CMD ["/bin/bash", "-c", "puma"]
