#
# Dockerfile
#
# Created on 2021-03-11
# Updated on 2021-03-13
#
# Copyright © Ryan Kan
#

# Use alpine 3.12.4
FROM alpine:3.12.4

# Set the working directory
WORKDIR /app

# Install all needed things
RUN apk add --update --progress make gcc==9.3.0-r2 libcap-dev==2.27-r0 libc-dev==0.7.2-r3 python3==3.8.5-r1 ncurses==6.2_p20200523-r0 asciidoc==8.6.10-r1

# Copy all program files into the docker container
COPY . .

# Make the `isolate` command
RUN make all
RUN make isolate
RUN make install

# Thing to execute when the container starts up
CMD ["setup-linux-cli"]
