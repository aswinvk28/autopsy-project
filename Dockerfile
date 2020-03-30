FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get dist-upgrade -y \
    && apt-get install -y \
    ant \
    ca-certificates \
    curl \
    dos2unix \
    fonts-noto \
    g++ \
    gcc \
    gpg \
    java-common \
    libafflib-dev \
    libboost-dev \
    libewf-dev \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libgstreamer1.0 \
    libsolr-java \
    libsqlite3-dev \
    libswt-gtk-4-java \
    libtika-java \
    libtool \
    libtsk-dev \
    libvhdi-dev \
    libvmdk-dev \
    make \
    openjdk-8-jre \
    openjfx \
    postgresql \
    software-properties-common \
    sqlite3 \
    testdisk \
    wget \
    zip \
    zlib1g-dev

RUN mkdir -p /opt/autopsy/

RUN apt-get update && apt-get install openssh-server sleuthkit -y

WORKDIR /opt/autopsy/
RUN wget http://prdownloads.sourceforge.net/dcfldd/dcfldd-1.3.4-1.tar.gz?download
WORKDIR /opt/autopsy/
RUN tar -xzf dcfldd-1.3.4-1.tar.gz?download
WORKDIR /opt/autopsy/dcfldd-1.3.4-1
RUN ./configure
WORKDIR /opt/autopsy/dcfldd-1.3.4-1
RUN make install
RUN alias dcfldd=/opt/autopsy/dcfldd-1.3.4-1/dcfldd

# with passphrase
COPY docker.pub /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes PasswordAuthentication yes PermitEmptyPasswords no/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 5678
CMD ["/usr/sbin/sshd", "-D"]
