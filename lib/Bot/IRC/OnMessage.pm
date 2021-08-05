package Bot::IRC::OnMessage;

use 5.018;
use strict;
use warnings;
use utf8;
use open qw (:std :utf8);

use version; our $VERSION = qw (1.0);

sub init {
	my ($bot) = @_;

	$bot->hook (
		{
			command => 'PRIVMSG',
		},

		sub {
			my $bot = shift;
			my $msg = shift;

			if ($msg->{full_text} =~ qr/^\s*\Q$bot->{nick}\E[\,|\:]?\s*$/i) {
				$bot->reply_to ('Чего тебе?');
			}

			return 1;
		},
	);

	return 1;
}

1;

__END__
