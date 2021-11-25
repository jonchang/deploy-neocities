FROM ruby:alpine

COPY Gemfile Gemfile.lock /

RUN wget https://github.com/jonchang/neocities-ruby/archive/refs/heads/fix-rubygems-command-error.zip

RUN unzip fix-rubygems-command-error.zip && rm fix-rubygems-command-error.zip

RUN bundle install --deployment

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
