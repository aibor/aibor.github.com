---
layout: article
title: Einer Ruby Methode ein Array statt einzelner Parameter übergeben
date: 2013-10-09 17:14:13
categories: articles
tags: ruby
---
Falls man eine Methode mit mehreren Parametern aufrufen will und diese sich schon in der richtigen Reihenfolge in einem Array befinden, kann man mit diesem direkt die Methode aufrufen:
{% highlight ruby %}
  tolles_array = [ "par", "a", "meter" ]
  tolle_methode( *tolles_array )
{% endhighlight %}
Dies entspricht dem Aufruf:
{% highlight ruby %}
  tolle_methode( "par", "a", "meter" )
{% endhighlight %}
