FROM twdps/gha-container-base-image:0.2.0

LABEL org.opencontainers.image.title="gha-container-builder" \
      org.opencontainers.image.description="Alpine-based github actions job container image" \
      org.opencontainers.image.documentation="https://github.com/ThoughtWorks-DPS/gha-container-builder" \
      org.opencontainers.image.source="https://github.com/ThoughtWorks-DPS/gha-container-builder" \
      org.opencontainers.image.url="https://github.com/ThoughtWorks-DPS/gha-container-builder" \
      org.opencontainers.image.vendor="ThoughtWorks, Inc." \
      org.opencontainers.image.authors="nic.cheneweth@thoughtworks.com" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.created="CREATED" \
      org.opencontainers.image.version="VERSION"

ENV BATS_VERSION=1.11.0
ENV HADOLINT_VERSION=2.12.0
ENV SNYK_VERSION=1.1291.0
ENV TRIVY_VERSION=0.51.1
ENV GRYPE_VERSION=0.77.4
ENV COSIGN_VERSION=2.2.4
ENV SYFT_VERSION=1.4.1
ENV ORAS_VERSION=1.1.0

# hadolint ignore=DL3004,DL3047
RUN sudo apk add --no-cache \
             nodejs-current==21.7.2-r0 \
             npm==10.2.5-r0 && \
    sudo npm install -g \
             snyk@${SNYK_VERSION} \
             bats@${BATS_VERSION} && \
    sudo chown -R root:root /usr/local/lib/node_modules && \
    curl -LO https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-linux-amd64 && \
    chmod +x cosign-linux-amd64 && sudo mv cosign-linux-amd64 /usr/local/bin/cosign && \
    sudo bash -c "curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin v${SYFT_VERSION}" && \
    curl -LO "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz" && \
    mkdir -p oras-install && \
    tar -zxf oras_${ORAS_VERSION}_*.tar.gz -C oras-install/ && \
    sudo mv oras-install/oras /usr/local/bin/ && \
    rm -rf ./oras_${ORAS_VERSION}_*.tar.gz oras-install/ && \
    curl -LO https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz && \
    tar xzf trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz trivy && \
    sudo mv trivy /usr/local/bin && rm trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz && \
    curl -LO https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64 && \
    sudo mv hadolint-Linux-x86_64 /usr/local/bin/hadolint && sudo chmod +x /usr/local/bin/hadolint && \
    curl -LO https://github.com/anchore/grype/releases/download/v${GRYPE_VERSION}/grype_${GRYPE_VERSION}_linux_amd64.tar.gz && \
    tar xzf grype_${GRYPE_VERSION}_linux_amd64.tar.gz grype && \
    sudo mv grype /usr/local/bin && rm grype_${GRYPE_VERSION}_linux_amd64.tar.gz
