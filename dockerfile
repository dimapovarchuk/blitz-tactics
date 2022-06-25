FROM ruby:2.7.3

ENV LANG C.UTF-8

#Install the required libraries
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev #nodejs

# Core dependencies
# RUN apt-get update && apt-get install -y curl sudo
# Node
# Uncomment your target version
# RUN curl -fsSL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# RUN sudo apt-get install -y nodejs
# RUN echo "NODE Version:" && node --version
# RUN echo "NPM Version:" && npm --version


#yarn package management tool installation
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

#Work directory settings
RUN mkdir /blitz-tactics
WORKDIR /blitz-tactics
ADD Gemfile /blitz-tactics/Gemfile
#ADD Gemfile.lock /blitz-tactics/Gemfile.lock
RUN bundle install && \
yarn install && \
gem update bundle
COPY . /blitz-tactics
EXPOSE 8080