# oemcp
Small utility to get corresponding OEM code page from current locale (posix). License: WTFPL

Run oemcp_gen.pl inside wine/dlls/kernel32/nls from Wine source code tree to generate oemcp.sh

Why do you need this tool? Windows store file names in .zip archives using so called OEM code page. That's why you sometimes see wrong characters when trying to open .zip file.

So you can put oemcp.sh to /usr/bin (don't forget to do `chmod 755` on it), run export UNZIP="-O cp\`oemcp.sh\`" and have your archives encoding detected automatically based on system locale.

UPD: unzip610b_oemcpauto.tar.gz is unzip from sourceforge patched to support proper OEM code page auto detection.  	unzip_oemcpauto_unix.c.patch is patch itself. Make by `make -f unix/Makefile generic`. amd_64 binary included.
https://sourceforge.net/p/infozip/patches/29/

UPD#2: p7zip_16.02_oemcpauto.tar.gz and p7zip_oemcp_ZipItem.cpp.patch - the same for p7zip
https://sourceforge.net/p/p7zip/bugs/187/
