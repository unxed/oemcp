#!/usr/bin/perl

open(FH, '>', 'oemcp.sh') or die $!;

print FH "#!/bin/bash\n";
print FH "lang=\$(locale | grep \"LANGUAGE\" | sed -n -e 's/^LANGUAGE=//p')\n";

$dir = ".";
opendir DIR, $dir;
my @dir = readdir(DIR);
close DIR;

##print join(", ", @parts),"\n";

foreach(sort @dir) {

    if (-f $dir . "/" . $_ ) {
    
        my @parts = split "\\.", $_;
        if (@parts[1] eq 'nls') {

            open(my $file, '<', $dir . "/" . $_) or die "Unable to open $!";
            my @strings=<$file>;
            foreach(@strings) {
                my ( @match1 ) = ($_ =~ /(LOCALE_IDEFAULTCODEPAGE "(\d+)")/g);
                if ($match1[1]) { $cp = $match1[1]; }
                my ( @match2 ) = ($_ =~ /(LOCALE_SISO3166CTRYNAME "(\w+)")/g);
                if ($match2[1]) { $cn = $match2[1]; }
                my ( @match3 ) = ($_ =~ /(LOCALE_SISO639LANGNAME "(\w+)")/g);
                if ($match3[1]) { $ln = $match3[1]; }
            }

            if (($cn ne '029') && ($cp ne '1')) {
                print $ln, '_', $cn, ',', $cp, "\n";

                print FH 'if [ "$lang" = "', $ln, '_', $cn, '" ]; then', "\n";
                print FH "echo '$cp'\n";
                print FH "exit\n";
                print FH "fi\n";
            }
        }
    }
}

print FH "echo 437\n";

close(FH);

chmod 0755, 'oemcp.sh';
