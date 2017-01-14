# The details can be found in the following web page.
# https://support.makerbot.com/learn/makerbot-desktop-software/getting-started/how-to-install-makerbot-desktop-for-linux_11262

FROM ubuntu:14.04

RUN apt-get update -y && \
    apt-get upgrade -y

# Install apt-add-repository and wget
RUN apt-get install software-properties-common wget -y

# Add the repository
RUN apt-add-repository 'http://downloads.makerbot.com/makerware/ubuntu' -y
RUN wget http://downloads.makerbot.com/makerware/ubuntu/dev@makerbot.com.gpg.key && \
    apt-key add dev@makerbot.com.gpg.key -y

# Install makerware
RUN apt-get update -y && apt-get install makerware -y
RUN apt-get install libqt5webkit5 libqt5webkit5-dev -y
RUN apt-get install libyajl2 -y

# Add a user (makerbot)
RUN touch /.Xauthority && \
    chmod 600 /.Xauthority

# Add run.sh
ADD run.sh /run.sh
RUN chmod 777 /*.sh

# Change the user to makerbot
ENV XAUTHORITY /.Xauthority
ENV HOME /home/

# Start makerware
CMD ["/run.sh"]
