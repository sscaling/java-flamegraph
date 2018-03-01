FROM 		openjdk:8-alpine
MAINTAINER	sscaling <shaun@shaunscaling.com>

# Install any dependencies
RUN apk add --update \
    perl \
    curl \
  && rm -rf /var/cache/apk/*

# Grab honest profiler
RUN	wget http://insightfullogic.com/honest-profiler.zip \
	&& unzip -d /usr/local/bin honest-profiler.zip \
	&& rm honest-profiler.zip

# Grab flamegraph
RUN	curl -o /usr/local/bin/flamegraph.pl https://raw.githubusercontent.com/brendangregg/FlameGraph/master/flamegraph.pl \
	&& chmod +x /usr/local/bin/flamegraph.pl

COPY	start.sh /

WORKDIR	/source


#ENTRYPOINT ["/bin/sh", "-c", "/start.sh"]
ENTRYPOINT ["/start.sh"]

CMD ["foo", "bar"]
