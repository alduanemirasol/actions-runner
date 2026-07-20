FROM ubuntu:24.04

ARG RUNNER_VERSION=2.335.1

ENV RUNNER_ALLOW_RUNASROOT=1
ENV RUNNER_URL=https://github.com/actions/runner/releases/download

RUN apt-get update
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y libicu74
RUN apt-get install -y docker.io

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /actions-runner

RUN curl -L -o runner.tar.gz ${RUNNER_URL}/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN tar -xzf runner.tar.gz
RUN rm runner.tar.gz

COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]