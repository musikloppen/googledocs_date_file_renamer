#!/opt/local/bin/perl -w

use POSIX qw( strftime );
use strict;

my $start = 1704106800;	# first monday
my $week_length = 604800;

opendir(DIR, ".") || die $!;
while (readdir(DIR)) {
	unless (/^\./) {
		print "mv " . qq["$_"] . " " . strftime("%m.%d.%y", localtime($start)) . ".gdoc\n";
		$start += $week_length;
	}
}

__END__
