# oemcp
Small utility to get corresponding OEM code page from current locale (posix). License: WTFPL

Run oemcp_gen.pl inside wine/dlls/kernel32/nls from Wine source code tree to generate oemcp.sh

Why do you need this tool? Windows store file names in .zip archives using so called OEM code page. That's why you sometimes see wrong characters when trying to open .zip file.

So you can put oemcp.sh to /usr/bin (don't forget to do `chmod 755` on it), run export UNZIP="-O cp\`oemcp.sh\`" and have your archives encoding detected automatically based on system locale.

For sure OEM code page autodetection trick should be done inside unzip tool itself, but I do not know where actual development repo is, and lastest sourceforge snapshot fails to build on my system. Maybe one day I will find some time to implement it. Maybe not.

PS: unzip's OEM charset processing is done in init_conversion_charsets() inside unix/unix.c
