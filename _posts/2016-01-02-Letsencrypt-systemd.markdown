---
layout: article
categories: articles
date: 2016-01-02 21:26:09
title: Letsencrypt systemd
tags: letsencrypt systemd arch
---
Flipez hat in seinem Blog kürzlich [eine Möglichkeit zur
vollautomatischen Integration von Letsencrypt auf einem
Arch-System](https://blog.flipez.de/2015/11/17/letsencrypt/)
beschrieben. Da ich gerade ein solches frisches System zur Hand hatte,
welches TLS-Zertifikate für HTTPS benötigte, habe ich direkt fröhlich
und dankbar in den copy&paste-Modus geschalten. Allerdings nur bis zu
den systemd Dateien.

Auf einem Webserver habe ich meist mehrere vhosts. Ich möchte weder bei
jedem neu hinzugekommen vhost die service-Datei anpassen, noch für jeden
vhost jeweils zwei systemd files anlegen müssen (service für den
hostnamen und timer für diesen service). Stattdessen habe ich mir
folgende parametrisierte units erstellt:

{% highlight ini %}
  # /etc/systemd/system/letsencrypt-renew@.service
  [Unit]
  Description=renew certificates for %I

  [Service]
  Type=oneshot
  ExecStartPre=/usr/bin/mkdir -p /tmp/letsencrypt-auto
  ExecStart=/usr/bin/letsencrypt --renew certonly \
    --server https://acme-v01.api.letsencrypt.org/directory \
    -a webroot --webroot-path=/tmp/letsencrypt-auto \
    -d %I
  ExecStartPost=/usr/bin/nginx -s reload

  [Install]
  WantedBy=multi-user.target
{% endhighlight %}

{% highlight ini %}
  # /etc/systemd/system/letsencrypt-renew@.timer
  [Unit]
  Description=run cert renew for %I every two month

  [Timer]
  OnUnitActiveSec=2month

  [Install]
  WantedBy=multi-user.target
{% endhighlight %}

Damit kann man nun für neue vhosts einfach jeweils einen neuen timer
anlegen:

{% highlight console %}
# systemctl start letsencrypt-renew@example.com.timer
# systemctl enable letsencrypt-renew@example.com.timer
{% endhighlight %}

