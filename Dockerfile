FROM ruby:2.6-slim as builder

RUN apt-get update && apt-get install build-essential -y && apt-get install default-libmysqlclient-dev -y
WORKDIR /opt/app
RUN gem install bundler
COPY Gemfile* ./
RUN bundle install --jobs 3 --without test development

# Docker image for non-local environments (dev, staging, production, etc)
FROM ruby:2.6-slim
RUN apt-get update && apt-get install default-libmysqlclient-dev -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV=production
WORKDIR /opt/app
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . /opt/app
COPY --from=builder /opt/app/Gemfile.lock /opt/app/

CMD ["/usr/local/bundle/bin/bundle", "exec", "rails", "s"]