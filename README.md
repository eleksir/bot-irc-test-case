Test case:

If you type in irc client in english - everyting works just file.
If you type in russian/utf-8 - bot complins about wide chars.

Perl says about its version:
```
[eleksir@hp ~]$ perl -v

This is perl 5, version 32, subversion 1 (v5.32.1) built for x86_64-linux-thread-multi

Copyright 1987-2021, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

[eleksir@hp ~]$
```

perl running on:
```
[eleksir@hp ~]$ cat /etc/alpine-release
3.13.4
[eleksir@hp ~]$
```

It's irssi text:
```
 test channel
 01:29 -!- eleksir [~eleksir@127.0.0.1] has joined #a
 01:29 -!- Topic for #a: test channel
 01:29 -!- Topic set by -Server- [] [Fri Aug  6 01:24:47 2021]
 01:29 [Users #a]
 01:29 [ case] [ eleksir]
 01:29 -!- Irssi: #a: Total of 2 nicks [0 ops, 0 halfops, 0 voices, 2 normal]
 01:29 -!- Channel #a created Fri Aug  6 01:24:47 2021
 01:29 -!- Irssi: Join to #a was synced in 2 secs
 01:29 < eleksir> case
 01:29 < case> eleksir: Чего тебе?
 01:30 < eleksir> да так, ничего

```

it's bot log:
```
[eleksir@hp bot-irc-test-case]$ ./runme.sh
[06/Aug/2021:01:28:34 +0300] <<< USER case 0 * :Bot::IRC test case
[06/Aug/2021:01:28:34 +0300] <<< NICK case
[06/Aug/2021:01:28:34 +0300] :irc.example.net 001 case :Welcome to the Internet Relay Network case!~case@127.0.0.1
[06/Aug/2021:01:28:34 +0300] <<< JOIN #a
[06/Aug/2021:01:28:34 +0300] :irc.example.net 002 case :Your host is irc.example.net, running version ngircd-26.1 (x86_64/alpine/linux-musl)
[06/Aug/2021:01:28:34 +0300] :irc.example.net 003 case :This server has been started Fri Aug 06 2021 at 01:24:47 (MSK)
[06/Aug/2021:01:28:34 +0300] :irc.example.net 004 case irc.example.net ngircd-26.1 abBcCFiIoqrRswx abehiIklmMnoOPqQrRstvVz
[06/Aug/2021:01:28:34 +0300] :irc.example.net 005 case RFC2812 IRCD=ngIRCd CHARSET=UTF-8 CASEMAPPING=ascii PREFIX=(qaohv)~&@%+ CHANTYPES=#&+ CHANMODES=beI,k,l,imMnOPQRstVz CHANLIMIT=#&+:10 :are supported on this server
[06/Aug/2021:01:28:34 +0300] :irc.example.net 005 case CHANNELLEN=50 NICKLEN=9 TOPICLEN=490 AWAYLEN=127 KICKLEN=400 MODES=5 MAXLIST=beI:50 EXCEPTS=e INVEX=I PENALTY FNC :are supported on this server
[06/Aug/2021:01:28:34 +0300] :irc.example.net 251 case :There are 1 users and 0 services on 1 servers
[06/Aug/2021:01:28:34 +0300] :irc.example.net 254 case 2 :channels formed
[06/Aug/2021:01:28:34 +0300] :irc.example.net 255 case :I have 1 users, 0 services and 0 servers
[06/Aug/2021:01:28:34 +0300] :irc.example.net 265 case 1 1 :Current local users: 1, Max: 1
[06/Aug/2021:01:28:34 +0300] :irc.example.net 266 case 1 1 :Current global users: 1, Max: 1
[06/Aug/2021:01:28:34 +0300] :irc.example.net 250 case :Highest connection count: 1 (2 connections received)
[06/Aug/2021:01:28:34 +0300] :irc.example.net 375 case :- irc.example.net message of the day
[06/Aug/2021:01:28:34 +0300] :irc.example.net 372 case :- "Hello world!"
[06/Aug/2021:01:28:34 +0300] :irc.example.net 376 case :End of MOTD command
[06/Aug/2021:01:28:35 +0300] :case!~case@127.0.0.1 JOIN :#a
[06/Aug/2021:01:28:35 +0300] :irc.example.net 332 case #a :test channel
[06/Aug/2021:01:28:35 +0300] :irc.example.net 333 case #a -Server- 1628202287
[06/Aug/2021:01:28:35 +0300] :irc.example.net 353 case = #a :case
[06/Aug/2021:01:28:35 +0300] :irc.example.net 366 case #a :End of NAMES list
[06/Aug/2021:01:29:11 +0300] :eleksir!~eleksir@127.0.0.1 JOIN :#a
[06/Aug/2021:01:29:43 +0300] :eleksir!~eleksir@127.0.0.1 PRIVMSG #a :case
[06/Aug/2021:01:29:43 +0300] <<< PRIVMSG #a :eleksir: Чего тебе?
[06/Aug/2021:01:30:20 +0300] :eleksir!~eleksir@127.0.0.1 PRIVMSG #a :да так, ничего
[06/Aug/2021:01:30:20 +0300] Wide character in print at /usr/lib/perl5/core_perl/IO/Handle.pm line 431, <GEN0> line 23.
```

it's ngircd config
```ini
[eleksir@hp ~]$ egrep -v '^\s*[#;]' /etc/ngircd/ngircd.conf|grep -v '^$'
[Global]
        Name = irc.example.net
        AdminInfo1 = Test IRC Server
        AdminInfo2 = Localhost
        HelpFile = /usr/share/doc/ngircd/Commands.txt
        Info = Test IRC Server
        Listen = 127.0.0.1
        MotdPhrase = "Hello world!"
[Limits]
[Options]
        AllowedChannelTypes = #&+
        DNS = no
        Ident = no
        OperChanPAutoOp = yes
        PAM = no
[Operator]
        Name = eleksir
[Operator]
[Server]
[Server]
[Channel]
        Name = #a
        Topic = test channel
[Channel]
[eleksir@hp ~]$
```
