FROM adoptopenjdk/openjdk11:armv7l-debianslim-jdk-11.0.8_10-slim
ARG JMETER_VERSION="5.3"

ENV JMETER_VERSION ${JMETER_VERSION:-5.3}

RUN apt-get update && apt-get install -y \
    curl unzip \
 && rm -rf /var/lib/apt/lists/*

RUN cd /var/lib && \
    curl https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -o apache-jmeter-$JMETER_VERSION.tgz && \
    tar xf apache-jmeter-$JMETER_VERSION.tgz && \
    rm -f apache-jmeter-$JMETER_VERSION.tgz

ENV PATH "$PATH:/var/lib/apache-jmeter-$JMETER_VERSION/bin"

ARG TARGET_HOST
ARG TARGET_PORT
ARG DURATION_SECONDS
ARG RAMPUP_SECONDS
ARG NUM_THREADS
ARG THROUGHPUT
ARG TEST_DATA_FILE
ARG TEST_FILE

ENV TARGET_HOST=${TARGET_HOST}
ENV TARGET_PORT=${TARGET_PORT}
ENV DURATION_SECONDS=${DURATION_SECONDS}
ENV RAMPUP_SECONDS=${RAMPUP_SECONDS}
ENV NUM_THREADS=${NUM_THREADS}
ENV THROUGHPUT=${THROUGHPUT}
ENV TEST_DATA_FILE=${TEST_DATA_FILE:-/test-data.txt}
ENV TEST_FILE=${TEST_FILE:-/test-file.jmx}

# copy test data and jmx file
COPY ${TEST_DATA_FILE} .
COPY ${TEST_FILE} .

# make jrunner home directory
RUN mkdir -p /home/jrunner && groupadd -r -g 10001 jrunner && useradd -r -u 10001 -g jrunner jrunner

# make jrunner own the home directory
RUN chown -R jrunner:jrunner /home/jrunner

# set current user to jrunner
USER jrunner

# run test - keep report and log file output in case we want to switch back to a replicaset from the batch job
CMD jmeter -n -t ${TEST_FILE} -j /logs/loadtest.log > /logs/loadtest.out -l /logs/loadtest-results.log -JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT:-80} -JDURATION_SECONDS=${DURATION_SECONDS} -JRAMPUP_SECONDS=${RAMPUP_SECONDS} -JNUM_THREADS=${NUM_THREADS} -JTHROUGHPUT=${THROUGHPUT} -JTEST_DATA_FILE=${TEST_DATA_FILE} -e -o /reports
