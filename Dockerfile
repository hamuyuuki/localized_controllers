FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /usr/local/src/localized_controllers
WORKDIR /usr/local/src/localized_controllers
