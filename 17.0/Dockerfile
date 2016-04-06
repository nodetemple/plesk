FROM ubuntu:14.04.4
MAINTAINER hostmaster@nodetemple.com

ENV PLESK_DISABLE_HOSTNAME_CHECKING 1

ADD key.xml run.sh ./

RUN sed -i -e 's/exit.*/exit 0/g' /usr/sbin/policy-rc.d \
    && echo 'Europe/Vilnius' > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get purge -y apparmor \
    && apt-get install -y wget \
    && wget -q -O /root/ai http://autoinstall.plesk.com/plesk-installer \
    && bash /root/ai \
        --all-versions \
        --select-product-id=plesk \
        --select-release-id=PLESK_17_0_10 \
        --install-component panel \
        --install-component bind \
        --install-component web-hosting \
        --install-component webservers \
        --install-component nginx \
        --install-component phpgroup \
        --install-component phpfpm \
        --install-component php5.6 \
        --install-component php7.0 \
        --install-component mod_fcgid \
        --install-component mod-bw \
        --install-component mysqlgroup \
        --install-component proftpd \
        --install-component postfix \
        --install-component dovecot \
        --install-component spamassassin \
        --install-component roundcube \
        --install-component awstats \
        --install-component fail2ban \
        --install-component modsecurity \
        --install-component psa-firewall \
        --install-component health-monitor \
        --install-component config-troubleshooter \
        --install-component git \
        --install-component l10n \
    && plesk bin init_conf --init \
        -email hostmaster@nodetemple.com \
        -passwd nodetemple \
        -hostname-not-required -encrypted-password -admin_info_not_required true \
        -license_agreed true -send_announce false -send_tech_announce false \
    && plesk bin license -i key.xml \
    && plesk bin poweruser --off \
    && plesk bin cloning -u -prepare-public-image true -reset-license false -reset-init-conf false -skip-update true \
    && plesk bin ipmanage --auto-remap-ip-addresses true \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /root/ai /root/parallels /var/lib/apt/lists/* /tmp/* /var/tmp/*

#-default-ip ${EXTERNAL_IP} -netmask 255.255.0.0 -iface eth0 -ip-type shared

CMD /run.sh

# Port to expose
# 21 - ftp
# 25 - smtp
# 53 - dns
# 80 - http
# 110 - pop3
# 143 - imaps
# 443 - https
# 3306 - mysql
# 8880 - plesk via http
# 8443 - plesk via https
# 8447 - plesk installer/updater UI
EXPOSE 21 80 443 8880 8443 8447
