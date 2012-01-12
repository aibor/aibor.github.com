---
layout: article
title: SSH-Backup
categories: articles
---
Backup eines entfernten Ordners mittels ssh als tar.gz
{% highlight bash %}
$ ssh SSHTARGET "tar czvf - ." > backup.tar.gz
{% endhighlight %}
