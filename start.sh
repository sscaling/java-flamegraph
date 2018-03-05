#!/bin/sh

if [ -z "$PROFILER_INTERVAL" ]; then
	PROFILER_INTERVAL=7
fi

# Input is the command to java to start the process
java -XX:+PreserveFramePointer -agentpath:"/usr/local/bin/liblagent.so=interval=$PROFILER_INTERVAL,logPath=/tmp/log.hpl" "$@" > /dev/null 2>&1

# Fold the stacktrace
java -cp /usr/local/bin/honest-profiler.jar com.insightfullogic.honest_profiler.ports.console.FlameGraphDumperApplication /tmp/log.hpl /tmp/log.folded > /dev/null 2>&1

# Assuming that completes, convert to flamegraph
flamegraph.pl /tmp/log.folded
