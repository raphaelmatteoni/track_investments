FROM ruby:3.2.2

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


# Install additional packages.
RUN apt update -qq
RUN apt install -y postgresql-client nodejs yarn

# Prepare working directory.
WORKDIR /track_investments
COPY Gemfile /track_investments/Gemfile
COPY Gemfile.lock /track_investments/Gemfile.lock
RUN gem install bundler
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]