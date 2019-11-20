FROM debian:stretch-slim

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME=/config

# Basic check it works.
RUN apt-get update && \
    apt-get -y install net-tools && \
    apt-get -y install curl && \
    apt-get -y install git && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client && \
    # Install Bats
    git clone https://github.com/bats-core/bats-core.git && cd bats-core && ./install.sh $HOME

COPY ./bats/* ./
COPY ./run.sh ./run.sh

RUN chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]