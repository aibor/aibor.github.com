---
layout: article
title: IPv6-Tunnel per OpenVPN 
categories: articles
tags: linux openvpn ipv6 
---
Schon seit längerem habe ich den Wunsch IPv6-Konnektivität im heimischen Netzwerk zu haben.
Mit einem [6in4-Tunnel von he.net][1] war ich jedoch sehr unzufrieden. Zum einen verarbeitet mein Router Protokoll 41 Pakete eigenartig, was in sehr instabilen Tunnelverbindungen resultiert. Wenn man den Router umgeht, indem man den IPv4-Traffic zum Tunnelendpunkt zum Beispiel über eine OpenVPN-Verbindung schickt, bekommt man zwar eine stabile Verbindung, aber auch recht hohe Latenzen. Außerdem besteht weiterhin das generelle Problem des he.net-Tunnels, dass kleine Pakete (wie pings) zwar einwandfrei übertragen werden, bei etwas größeren Paketen gibt es allerdings hohe Paketverluste und die Verbindung ist somit kaum brauchbar.

Seit kurzem hat mein vServer nun native IPv6-Konnektivität. Daher galt es einen neuen Versuch zu starten, IPv6 auch zu Hause zu nutzen. Da ich sowieso schon eine OpenVPN-Verbindung zum Server hatte, wollte ich diese auch als IPv6-Tunnel nutzen. Mit Version 2.3 bringt OpenVPN nun [vollständige IPv6-Unterstützung mit][2] und man kann IPv6 über tun Interfaces nutzen. Dazu müssen nur 2 Optionen in die Konfigurationsdatei des Servers hinzugefügt werden:
{% highlight console %}
server-ipv6 2001:cafe:babe:beef::/64
push "route-ipv6 ::/0"
{% endhighlight %}
Nach einem Neustart von Server und Client hat man nun IPv6-Konnektivität zwischen den Endpunkten.

Damit der Server die Pakete nun weiterleitet und Pakete auch den Weg zum Client finden, müssen ein paar Kernelparameter angepasst werden:
{% highlight %}
net.ipv6.conf.all.forwarding=1 # Forwarding aktivieren
net.ipv6.conf.eth0.proxy\_ndp=1 # Neighbor Solicitation weiterreichen
{% endhighlight %}
Außerdem muss man die Adresse des Clients für den [Neighbor Solicitation][3] Proxy angeben:
{% highlight %}
$ ip -6 neigh add proxy 2001:cafe:babe:beef::42 dev eth0
{% endhighlight %}
Anschließend sollten Pakete in beide Richtung ihren Weg finden.

Gefunden habe ich die [Lösung][4], nach langem Frickeln und verzweifeln, als ich den IPv6-Traffic auf dem Server mitgedumpt habe und mir die Neighbor Solicitation Anfragen des Gateways bezüglich meiner Client-Adresse auffielen.

[1]: http://ipv6.he.net/ 'Hurricane Electric IPv6'
[2]: http://www.heise.de/netze/meldung/Vollstaendige-IPv6-Implementierung-im-neuen-OpenVPN-1780000.html 'Vollständige IPv6-Implementierung im neuen OpenVPN Vollständige IPv6-Implementierung im neuen OpenVPN | heise Netze'
[3]: https://de.wikipedia.org/wiki/Neighbor_Discovery_Protocol#Neighbor_Solicitation_.E2.80.93_Type_135 'Neighbor Discovery Protocol | Wikipedia'
[4]: http://serverfault.com/questions/237851/how-can-i-setup-openvpn-with-ipv4-and-ipv6-using-a-tap-device 'How can I setup OpenVPN with IPv4 and IPv6 using a tap device? - Server Fault'
