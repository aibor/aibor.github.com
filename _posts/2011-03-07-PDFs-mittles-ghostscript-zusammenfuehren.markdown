---
layout: post
title: PDFs mittels ghostscript zusammenführen
categories: blog
tags: pdf shell
---
Neulich wollte ich mehrere pdf-Dateien zu einer einzigen zusammenführen. Dabei kam mir pdftk (pdf tool kit) in den Sinn. Das hatte ich unter Ubuntu für diese Aufgabe verwendet. Also wollte ich es mittels yaourt aus dem AUR installieren, doch eine der Abhängigkeiten brauchte ewig lang zum kompillieren. Daher suchte ich in dieser Zeit nach Alternativen und stolperte über einen zwar nicht sehr übersichtlichen, doch funktionalen Befehl. Dabei wird [ghostscript](https://secure.wikimedia.org/wikipedia/de/wiki/Ghostscript) verwendet, welches ich zwecks Druckerunterstützung schon installiert hatte. Damit das ganze auch einfach und schnell zur Anwendung kommen kann, habe ich den Befehl als Funktion in meine .bashrc aufgenommen:

{% highlight bash %}
function mergepdf() {
  gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$1 $@ 
}
{% endhighlight %}

Der erste Parameter gibt dabei den Namen der Ausgabe-pdf an und jedes weitere Parameter stellt eine Inputdatei dar.

{% highlight bash %}
$ mergepdf output.pdf *
{% endhighlight %}

Dieser Befehl würde also eine Datei namens "output.pdf" erzeugen, welche aus allen pdfs besteht, die im gerade aktiven Verzeichnis enthalten sind.
