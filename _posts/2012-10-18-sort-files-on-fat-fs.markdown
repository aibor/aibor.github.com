---
layout: article
title: Dateien auf FAT-Dateisystem sortieren
categories: articles
tags: linux fat mp3player
---
Die meisten MP3-Player nutzen als Dateisystem FAT32. Das ist an sich noch kein großes Problem, allerdings haben die meisten MP3-Player auch keine gute Software. Das Problem resultiert nun aus der Verbindung dieser zwei Fakten:

Man hat die ID3-Tags seiner MP3-Dateien fein säuberlich angelegt, diesen auch ordentliche Dateinamen gegeben, so dass sie nach Titelnummern sortiert werden können. Nun kopiert man diese feinen Dateien auf seinen MP3-Player, navigiert in der Ordneransicht des Players in den entsprechenden Ordner und muss feststellen, dass die Dateien scheinbar durcheinander aufgelistet werden. Die Software des Players listet sie so, wie sie im Dateisystem angelegt wurden und FAT tut dies in der Reihenfolge, wie sie geschrieben wurden.  
Eine Möglichkeit wäre nun die Dateien einzeln zu kopieren in der Reihenfolge, wie man sie gern haben will.

Die schnelle Alternative ist [fatsort](http://fatsort.sourceforge.net/). Man kopiert einfach alle Ordner und Dateien auf den Player, unmounted diesen und ruft fatsort auf. Dieses Programm ordnet dann die Dateien in alphabetischer Reihenfolge (oder beliebig anders, wenn man die Optionen anpasst).
