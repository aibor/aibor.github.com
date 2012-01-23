---
layout: article
title: Anzahl neuer mails in Thunderbird
categories: articles
---
Zeige Anzahl neuer Mails in Thunderbird-Postfächern an:  

{% highlight console %}
$ printf "%d" 0x$(
> tac .thunderbird/777onpwz.default/Mail/smart\ mailboxes/Inbox.msf |
> grep -m 1 \(\^A2=.*\) |
> sed -nr 's/.*\^A2=(.*)\).*/\1/p')
{% endhighlight %}
