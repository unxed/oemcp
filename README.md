# oemcp
Small utility to get corresponding OEM code page from current locale (posix). License: Public Domain

Run oemcp_gen.pl inside wine/dlls/kernel32/nls from Wine source code tree to generate oemcp.sh

Why do you need this tool? Windows store file names in .zip archives using so called OEM code page. That's why you sometimes see wrong characters when trying to open .zip file. This is well-known issue plaguing open source community, see this issue for example:
https://github.com/mate-desktop/engrampa/issues/5

So you can put oemcp.sh to /usr/bin (don't forget to do `chmod 755` on it), run export UNZIP="-O cp\`oemcp.sh\`" and have your archives encoding detected automatically based on system locale.

UPD: unzip610b_oemcpauto.tar.gz is unzip from sourceforge patched to support proper OEM code page auto detection. unzip_oemcpauto_unix.c.patch is a patch itself. Make by `make -f unix/Makefile generic`
https://sourceforge.net/p/infozip/patches/29/

UPD#2: p7zip_16.02_oemcpauto.tar.gz and p7zip_oemcp_ZipItem.cpp.patch - the same for p7zip
https://sourceforge.net/p/p7zip/bugs/187/

UPD#3: Built [.deb with patched p7zip](https://github.com/unxed/oemcp/blob/master/p7zip-oemcp.deb) for testing purposes. NB, it will overwrite your existing p7zip installation, so install with `sudo dpkg -i p7zip-oemcp.deb`, uninstall with `sudo apt remove p7zip-oemcp && sudo apt reinstall p7zip-full p7zip`. This is amd64 package built on Mint 20, so it should work on Ubuntu 20.04 and later also. [Engrampa](https://github.com/mate-desktop/engrampa) processes file names in OEM charset like a charm with this package installed on my system.
