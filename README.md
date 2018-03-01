<p>
    <a href="https://hub.docker.com/r/sscaling/java-flamegraph/">
        <img src="https://img.shields.io/docker/automated/sscaling/java-flamegraph.svg" />
    </a>
    <a href="https://hub.docker.com/r/sscaling/java-flamegraph/">
        <img src="https://img.shields.io/docker/build/sscaling/java-flamegraph.svg" />
    </a>
</p>

Java Flamegraph
===============

Docker image to package together tooling for generating [Flame graphs](http://www.brendangregg.com/flamegraphs.html) based loosely on [codecentric blog](https://blog.codecentric.de/en/2017/09/jvm-fire-using-flame-graphs-analyse-performance/)

Based on the official openjdk alpine docker image for Java 8.

This is available via [Docker Hub](https://hub.docker.com/r/sscaling/java-flamegraph/)

Building
--------

```
docker build -t sscaling/java-flamegraph .
```

Running
-------

```
docker run --rm -v $PWD:/source sscaling/java-flamegraph [java arguments] > flamegraph.svg
```

**NOTE:** Due to honest-profiler configuring the `-agent` property, this should not be specified in the java arguments

The output will be an SVG file written to stdout

You may find this useful to configure an alias, so this can be easily executed

```
$ alias javafg='docker run -v $PWD:/source sscaling/java-flamegraph'
$ javafg -cp target/myproject-1.0-SNAPSHOT.jar com.sscaling.test.TestApp > results.svg
```

Notes
-----

-	Currently this uses openjdk, Java 8. If you have an application requiring a newer version of Java, this is likely to be incompatible.
-	As per the license, software is provided as-is. This is just repackaging existing components - no original work is included in this project.
