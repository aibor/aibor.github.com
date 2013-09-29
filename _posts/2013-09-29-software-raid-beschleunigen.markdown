---
layout: article
title: Software-RAID Resync beschleunigen
categories: articles
tags: linux raid mdadm 
---
Standardmäßig läuft ein resync nicht besonders schnell ab, dafür werden aber auch möglichst wenig Resourcen belegt. Möchte man einen resync jedoch beschleungen, kann man dies einfach über zwei Kernelparameter anpassen

* dev.raid.speed_limit_min
* dev.raid.speed_limit_max

Diese geben die Schreibrate in Kilobytes/s an und stehen per default auf 1000 und 200000.

Quelle: ["5 Tips To Speed Up Linux Software Raid Rebuilding And Re-syncing"](http://www.cyberciti.biz/tips/linux-raid-increase-resync-rebuild-speed.html)
