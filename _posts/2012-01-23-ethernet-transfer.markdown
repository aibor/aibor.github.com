---
layout: article
title: Datentransfer im LAN ohne Crossoverkabel
categories: articles
tags: linux lan
---
Mit modernen Netzwerkkarten (selbst mein 10 Jahre alter Medion-Laptop hat eine solche) kann man ohne Crossoverkabel direkt ein Netzwerk zwischen 2 PCs herstellen. Dafür müssen die Netzwerkkarten [Autonegation][1] beherrschen.
Überprüfen kann man das mittels [ethtool][2]:

    ...
    Supports auto-negotiation: Yes
    ...

Falls die Netzwerkkarten taugen, kann man sie nun mit einem Netzwerkkabel verbinden und die Netzwerkgeräte aktivieren (meistens eth0):

    # ifconfig eth0 up

Um eine Verbindung herzustellen, muss beiden Netzwerkschnittstellen eine [IP-Adresse und Standard-Route zugewiesen][3] werden. IP-Namensraum kann man frei wählen:

    # ip addr add 100.100.1.1/24 dev eth0
    # ip route add default via 100.100.1.2 dev eth0

Hier hat das Gerät nun die IP-Adresse 100.100.1.1 und schickt seinen Netzwerkverkehr zu 100.100.1.2. Dementsprechend sollte das andere Gerät die IP 100.100.1.2 erhalten und nach 100.100.1.1 routen, damit man zwischen den Geräten in beide Richtungen Daten senden kann.

[1]: https://de.wikipedia.org/wiki/Autonegotiation
[2]: https://en.wikipedia.org/wiki/Ethtool
[3]: https://wiki.archlinux.org/index.php/Network#Manual_assignment
