---
layout: article
title: I Can Haz IP
categories: articles
tags: ip nginx nat
---
Manchmal ist es hilfreich, einen Dienst zu haben, der einem die eigene
öffentliche IP-Adresse zurückliefert. Zum Beispiel wenn man in einem
Netzwerk unterwegs ist, welches via NAT mit dem Internet telefoniert.

Falls man einen Server hat auf dem nginx läuft, kann man sich einen
solchen Dienst leicht selbst schaffen. Dazu einfach einen neuen server
Abschnitt in die nginx config packen, z.B. so:

    server {
        listen        80;
        listen        [::]:80;
        server_name   ~ipv?[46]?.example.com;

        default_type  text/plain;
        return        200 $remote_addr;
    }

Dieser lauscht auf IPv4 als auch auf IPv6 jeweils auf Port 80 auf
folgende Servernamen:

* ip.example.com
* ip4.example.com
* ipv4.example.com
* ip6.example.com
* ipv6.example.com

Zurückgegeben wird ein `text/plain` Dokument, welches nur die
IP-Adresse enthält.

Außerdem setzt man noch entsprechende DNS-Einträge für die Subdomains.
`ip.example.com` sollte einen A und AAAA Eintrag bekommen. Die anderen
nur jeweils den zu Ihnen passenden.

Und schon kann man sich seine öffentliche IP-Adresse ausgeben lassen.
Bei Anfrage an `ip.example.com` erhält man, je nachdem wie sein System
die Verbindung aufbaut, die IPv4 oder IPv6-Adresse. Falls man explizit
die IPv4-Adresse wissen möchte, hilft z.B.:

    $ curl ipv4.example.com

