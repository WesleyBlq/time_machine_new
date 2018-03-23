FROM ruby:2.3.3
MAINTAINER Wesley Monroe

RUN apt-get update  
RUN apt-get install -y apt-utils git build-essential libpq-dev curl  
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -  
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y yarn

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
# RUN apt-get update && apt-get install -y \ 
#   apt-utils \
#   build-essential \
#   apt-transport-https \
#   nodejs
  

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update && apt-get install -y yarn
  

# RUN apt-get install yarn

# Configure the main working directory. This is the base 
# directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
RUN mkdir -p /app 
WORKDIR /app

# # add ssh key
# COPY /Users/liangqibao/.ssh/id_rsa /root/.ssh
RUN  echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config
# RUN ssh-agent /tmp
# # RUN bundle install or similar command
# RUN rm /tmp/id_rsa

# ARG ssh_prv_key
# ARG ssh_pub_key

# Authorize SSH Host
# RUN mkdir -p /root/.ssh && \
#     chmod 0700 /root/.ssh && \
#     ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
# RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
#     echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
#     chmod 600 /root/.ssh/id_rsa && \
#     chmod 600 /root/.ssh/id_rsa.pub

# ENV RAILS_ENV production 
# ENV RACK_ENV production
# NODE_ENV production
# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
# COPY . ./

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 5001

# Remove SSH keys
RUN rm -rf /root/.ssh/

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
# RUN bundle exec rails assets:precompile
# RUN bundle exec rails db:create
# RUN bundle exec rails db:migrate
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5001"]