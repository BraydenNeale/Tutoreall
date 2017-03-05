FROM ruby:2.2.2

RUN apt-get update -yqq && apt-get install -yqq \
	build-essential \
	libpq-dev \
	postgresql-client \
	nodejs \
	imagemagick \
	libmagickwand-dev \
&& apt-get -q clean \
&& rm -rf /var/lib/apt/lists

WORKDIR /usr/src/tutorial_academy
COPY Gemfile* ./
RUN bundle install
COPY . .

CMD bundle exec puma -c ./config/puma.rb

