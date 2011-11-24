---
layout: post
title: Gehen Sie nicht über Los...
categories: blog
tags: windows installation usb
---
...ziehen Sie nicht 4000 Mark ein! Sondern starten Sie direkt neu - ins Windows XP auf der USB-Festplatte.
Neulich habe ich das Bedürfnis verspürt, Windows zu installieren. Eigentlich wollte ich nur ein Spiel spielen, was ich auf meinem Laptop unter Wine aber leider nicht zum Laufen bekommen habe. Also einfach Windows installieren...
Wenn man seine gesamte Festplatte, mit Ausnahme einer 200MB Bootpartition, mittels dm-crypt verschlüsselt hat, ist es leider nicht möglich eine Windowspartition anzulegen. Denn die verschlüsselte Partition kann man in der Größe nicht verändern.
Da ich meine darin befindlichen Systeme aber gern behalten wollte und keine Lust auf einen aufwendigen Verschiebe- und Partitionierungsprozess hatte, kam mir die Idee, Windows auf meiner externen Festplatte zu installieren. Leider unterstützt Windows XP dies nicht von Hause aus. Doch nach ein wenig Recherche bin ich auf eine einfache Methode gestoßen.
In [dieser Anleitung](http://www.kaltmacher.de/board/tutorials-f406/-os-windows-xp-auf-usb-festplatte-installieren-t96105.html) wird beschrieben, wie man sich mittels dem kleinen Tool [XP3eSD](http://sublimeporte.info/) ein modifiziertes Installationsimage erstellen kann. Damit ist es dann möglich, Windows direkt auf eine USB-Festplatte zu installieren - sofern das BIOS das Booten von USB-Platten ermöglicht, was seit einigen Jahren allerdings Standard ist.
Das einzige Manko ist, dass man keinen virtuellen Speicher nutzen kann. Doch mit ausreichend RAM läuft das System dennoch zügig und selbst Spiele sind möglich
