FROM ubuntu:latest

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get install -y sqlite3 && \ 
    apt-get install -y openssh-server && \
    apt-get install -y openssh-client && \
    apt-get install -y curl && \
    apt-get install -y gnupg2 && \ 
    apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    \curl -sSL https://get.rvm.io | bash -s stable && \
    /bin/bash -l -c "source /etc/profile.d/rvm.sh && rvm install 2.4 && gem install rails -v 5.0 && gem install bundle && gem install therubyracer" && \
    curl https://cli-assets.heroku.com/install.sh | sh


