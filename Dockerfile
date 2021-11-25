FROM ruby:2-alpine

RUN gem install --no-document neocities

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
