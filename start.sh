#!/bin/sh

# Input is the command to java to start the process
java -XX:+PreserveFramePointer -agentpath:/usr/local/bin/liblagent.so=interval=7,logPath=/tmp/log.hpl $@

# Fold the stacktrace
java -cp /usr/local/bin/honest-profiler.jar com.insightfullogic.honest_profiler.ports.console.FlameGraphDumperApplication /tmp/log.hpl /tmp/log.folded

# Assuming that completes, convert to flamegraph
flamegraph.pl /tmp/log.folded