FROM gcr.io/k8s-minikube/kicbase:v0.0.44

# Remove minikube bundled cri-o 1.24
RUN rm -f /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:1.24.list && \
    apt remove -y cri-o cri-o-runc cri-tools conmon && \
    apt autoremove -y

ENV CRIO_VERSION=v1.31
# https://github.com/cri-o/packaging/blob/main/README.md#distributions-using-deb-packages
RUN curl -fsSL https://pkgs.k8s.io/addons:/cri-o:/prerelease:/$CRIO_VERSION/deb/Release.key | \
    gpg --dearmor -o /etc/apt/keyrings/cri-o-apt-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/cri-o-apt-keyring.gpg] https://pkgs.k8s.io/addons:/cri-o:/prerelease:/$CRIO_VERSION/deb/ /" | \
    tee /etc/apt/sources.list.d/cri-o.list
RUN apt update -y && apt install -y cri-o cri-o-runc cri-tools