FROM ruby:3.4

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm

WORKDIR /app 

COPY app/Gemfile app/Gemfile.lock ./

RUN bundle install

COPY app ./

RUN chmod +x /app/entrypoint.sh 

RUN npm install --global yarn  

EXPOSE 3000

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]