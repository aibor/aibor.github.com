---
layout: article
categories: articles
date: 2016-05-18 17:34:02
date: 2016-05-18 19:26:38
title: Letsencrypt systemd revisited
tags: letsencrypt systemd arch
---
Kleine Ergänzung zum
[letzten Beitrag](http://blog.aibor.de/articles/2016/01/02/Letsencrypt-systemd.html).
Um leicht alle Zertifikate zu erneuern, ist auch folgende service unit
brauchbar. Diese läuft zudem nicht als root, sondern unprivilegierter
Benutzer. Voraussetzung ist daher, dass zum einen Der Benutzer angelegt
ist und dieser auf die alle benötigten Dateien (/etc/letsencrypt,
webroot, Logdateien unter /var/log/letsencrypt) Schreibrechte hat.

{% highlight ini %}
# /etc/systemd/system/letsencrypt-renew.service
[Unit]
Description=Run letsencrypt renew and reload webserver

[Service]
User=letsencrypt
PermissionsStartOnly=true
Type=oneshot
ExecStartPre=/usr/bin/chown -R letsencrypt: /var/log/letsencrypt
ExecStart=/usr/bin/letsencrypt renew
ExecStartPost=/usr/bin/nginx -s reload
{% endhighlight %}

Dazu kann dann die im vorigen Beitrag aufgeführte timer unit als
`letsencrypt-renew.timer` genutzt werden.
