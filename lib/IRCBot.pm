package IRCBot;

use 5.018;
use strict;
use warnings;
use utf8;
use open qw (:std :utf8);
use Bot::IRC;

use version; our $VERSION = qw (1.0);
use Exporter qw (import);
our @EXPORT_OK = qw (RunIRCBot);

sub RunIRCBot {
	my $bot = Bot::IRC->new (
		spawn  => 2,
		daemon => {
			name        => 'irc-bot-test-case',
			lsb_sdesc   => 'Bot::IRC test case',
			pid_file    => 'pidfile.pid',
			stderr_file => 'stderr.log',
			stdout_file => 'stdout.log',
		},
		connect => {
			server => '127.0.0.1',
			port   => 6667,
			nick   => 'case',
			name   => 'Bot::IRC test case',
			ssl    => 0,
			ipv6   => 0,
		},
	);

	$bot->load ('OnMessage');  # our main plugin that handles all the incomming messages, mostly
	$bot->helps (
		about => 'Test case bot.',
	);

	$bot->run ('/join #a');
}

1;

# vim: set ft=perl noet ai ts=4 sw=4 sts=4:
