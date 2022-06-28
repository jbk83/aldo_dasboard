# Dockerfile
FROM ruby:3.1.0

# Add yarn from repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y apt-utils nodejs yarn nano
RUN mkdir /docker-rails

WORKDIR /docker-rails
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock

RUN bundle install
COPY . /docker-rails
EXPOSE 3000 8080

CMD ["foreman", "start", "-p", "3000"]