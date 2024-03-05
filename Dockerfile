FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -y
RUN apt-get install -y tzdata
RUN mkdir /tread-api
WORKDIR /tread-api
COPY Gemfile* /tread-api/
RUN gem install bundler
RUN bundle install
COPY . /tread-api

ENV TZ="Asia/Kolkata"

# Add a script to be executed every time the container starts.
EXPOSE 9039

# Start the main process.

#CMD ["bundle", "exec", "rails", "server", "-b", "'ssl://0.0.0.0:3000?key=certificateIN.key&cert=certificate.crt'"]

RUN chmod +x /tread-api/entrypoint.sh
ENTRYPOINT ["/tread-api/entrypoint.sh"]