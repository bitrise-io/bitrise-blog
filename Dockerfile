FROM ruby:2.2.9

RUN apt-get update -qq && apt-get install
RUN apt-get install -y nodejs npm
RUN apt-get install -y nodejs-legacy

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
ADD . /app
