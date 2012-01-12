---
layout: article
title: Verschlüsselung einzelner Dateien
categories: articles
tags: linux shell verschlüsselung
---
Zur schnellen Verschlüsslung einzener Dateien habe ich folgende [Syntax gefunden](https://bbs.archlinux.org/viewtopic.php?id=116152), die in die bashrc gehört:
{% highlight bash linenos %}
CRYPT_EXT='3des'
encrypt () 
{ 
    local EFILE="$1.$CRYPT_EXT";
    local DFILE="$1";
    [[ -e "$DFILE" ]] || { 
        echo "File '$DFILE' not found";
        return 1
    };
    openssl des3 -salt -in "$DFILE" -out "$EFILE";
    chmod --reference="$DFILE" "$EFILE";
    [[ -e "$EFILE" ]] && shred -un64 "$DFILE"
}

decrypt () 
{ 
    local EFILE="$1";
    local DFILE="${1%.$CRYPT_EXT}";
    [[ -e "$EFILE" ]] || { 
        echo "File '$EFILE' not found";
        return 1
    };
    [[ "$DFILE" != "$EFILE" ]] || { 
        echo "Can only decrypt .$CRYPT_EXT files";
        return 2
    };
    openssl des3 -d -salt -in $EFILE -out $DFILE;
    [[ -e "$DFILE" ]] && rm -f "$EFILE"
}
{% endhighlight %}
Statt des3 kann wohl auch aes verwendet werden. Passwörter werden dabei anscheinend über die Standardeingabe eingelesen.

