FROM alpine

# Auto unarchive
ADD add.txt.gz /tmp

# Can ADD from remote
ADD https://github.com/github/fetch/blob/master/README.md /tmp

# Not auto unarchive
COPY copy.txt.gz /tmp

# COPY failed: source can't be a URL for COPY
# COPY https://github.com/github/fetch/blob/master/README.md ./

# RUN EXAMPLE
# 
# $ docker build . -t ex
# 
# $ docker run -it /bin/ash
#
# / # ls /tmp
# README.md    add.txt      copy.txt.gz
