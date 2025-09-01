FROM ruby:3

RUN gem install --verbose --no-document neocities

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
