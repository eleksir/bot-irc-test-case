#!/usr/bin/perl

use 5.018;
use strict;
use warnings;
use utf8;
use open qw (:std :utf8);
use English qw ( -no_match_vars );
use version; our $VERSION = qw (1.0);

my $workdir;

# before we run, change working dir
BEGIN {
	use Cwd qw (chdir abs_path);
	my @CWD = split /\//, abs_path ($PROGRAM_NAME);

	if ($#CWD > 1) {
		$#CWD = $#CWD - 2;
	}

	$workdir = join '/', @CWD;
	chdir $workdir;
}

use lib ("$workdir/lib", "$workdir/vendor_perl", "$workdir/vendor_perl/lib/perl5");
no Cwd;
use Cwd::utf8 qw (abs_path);
use IRCBot qw (RunIRCBot);

# set correct proctitle
$PROGRAM_NAME = abs_path $PROGRAM_NAME;  ## no critic (Variables::RequireLocalizedPunctuationVars)

RunIRCBot ();

exit 0;

__END__
# vim: set ft=perl noet ai ts=4 sw=4 sts=4:
