---
layout: post
title: Arch und Bluetooth
tags: arch bluetooth
---
Um unter meinem neuen Arch-System auf dem Laptop Präsentationen mit dem Handy steuern zu können, habe ich Bluetooth auf dem System eingerichtet. Das Paket "bluez" bringt alles mit, um die Bluetooth-Schnittstelle zu benutzen und das Pairing mit dem Handy durchzuführen.
Anschließend wußte ich nun nicht, was zu tun ist, damit ich die telefoneigene Software nutzen kann. Zum einen sollte dbus ansprechbar sein, daher habe ich eine consolekit-session eingerichtet und zum anderen ist die Datei /etc/bluetooth/rfcomm.conf korrekt einzurichten (bind yes, keine mac-Adressen-Beschränkung, channel 3).
Wenn ich nun den Bluetooth-Dienst starte, kann ich sofort mein Telefon als Fernsteuerung nutzen.
