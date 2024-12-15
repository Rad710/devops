#SOURCE: https://github.com/nestybox/dockerfiles/blob/master/ubuntu-noble-systemd-docker/Dockerfile


# Sample container image with Ubuntu Noble + Systemd
#
# Description:
#
# This image serves as a basic reference example for user's looking to
# run Systemd inside a system container in order to deploy various
# services within the system container, or use it as a virtual host
# environment.
#
# Usage:
#
# $ docker run --runtime=sysbox-runc -it --rm --name=syscont nestybox/ubuntu-noble-systemd
#
# This will run systemd and prompt for a user login; the default user/password
# in this image is "admin/admin".

FROM ubuntu:noble

#
# Systemd installation
#
RUN apt-get update &&                            \
    apt-get install -y --no-install-recommends   \
    systemd                              \
    systemd-sysv                         \
    libsystemd0                          \
    ca-certificates                      \
    dbus                                 \
    iptables                             \
    iproute2                             \
    kmod                                 \
    locales                              \
    sudo                                 \
    udev &&                              \
    \
    # Prevents journald from reading kernel messages from /dev/kmsg
    echo "ReadKMsg=no" >> /etc/systemd/journald.conf &&               \
    \
    # Housekeeping
    apt-get clean -y &&                                               \
    rm -rf                                                            \
    /var/cache/debconf/*                                           \
    /var/lib/apt/lists/*                                           \
    /var/log/*                                                     \
    /tmp/*                                                         \
    /var/tmp/*                                                     \
    /usr/share/doc/*                                               \
    /usr/share/man/*                                               \
    /usr/share/local/* &&                                          \
    \
    # Create default 'admin/admin' user
    useradd --create-home --shell /bin/bash admin && echo "admin:admin" | chpasswd && adduser admin sudo

# Disable systemd services/units that are unnecessary within a container.
RUN systemctl mask systemd-udevd.service \
    systemd-udevd-kernel.socket \
    systemd-udevd-control.socket \
    systemd-modules-load.service \
    sys-kernel-debug.mount \
    sys-kernel-tracing.mount \
    sys-kernel-config.mount \
    e2scrub_reap.service \
    e2scrub_all.timer

# Make use of stopsignal (instead of sigterm) to stop systemd containers.
STOPSIGNAL SIGRTMIN+3

# Set systemd as entrypoint.
# ENTRYPOINT [ "/sbin/init", "--log-level=err" ]

# Sample container image with Ubuntu Noble + Systemd + Sshd + Docker.
#
# Usage:
#
# $ docker run --runtime=sysbox-runc -it --rm -P --name=syscont nestybox/ubuntu-noble-systemd-docker
#
# This will run systemd and prompt for a user login; the default
# user/password in this image is "admin/admin". Once you log in you
# can run Docker inside as usual. You can also ssh into the image:
#
# $ ssh admin@<host-ip> -p <host-port>
#
# where <host-port> is chosen by Docker and mapped into the system container's sshd port.
#

# FROM nestybox/ubuntu-noble-systemd:latest

# Install Docker
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh \
    # Add user "admin" to the Docker group
    && usermod -a -G docker admin
ADD https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker /etc/bash_completion.d/docker.sh

# Install Sshd
RUN apt-get update && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /home/admin/.ssh \
    && chown admin:admin /home/admin/.ssh

EXPOSE 22

# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]