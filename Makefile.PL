#!/usr/bin/perl

use strict;
use warnings;
use inc::Module::Install 0.77;

use ExtUtils::Liblist;
use Config;
use File::Spec::Functions;

my @inc = map { split } @Config{qw(usrinc incpath locincpth)};

sub has_lib { scalar grep { length } ExtUtils::Liblist->ext("-l$_[0]") }

sub has_bdb {
	eval { require BerkeleyDB }
		or
	exists $ENV{BERKELEYDB_LIB}
		or
	-e '/usr/local/BerkeleyDB'
		or
	has_lib("db") or has_lib("libdb");
}

sub has_uuid {
	foreach my $inc ( @inc ) {
		return 1 if -e catfile($inc, qw(uuid uuid.h));
	}

	return 0;
}

sub has_dbd {
	eval { require DBD::SQLite }
		or
	eval { require DBD::Pg }
		or
	eval { require DBD::mysql }
}


name 'Task-KiokuDB';
all_from 'lib/Task/KiokuDB.pm';

requires 'Test::use::ok';
requires 'KiokuDB';

feature 'Files backend',
  -default                  => 1,
  'KiokuDB::Backend::Files' => 0;

feature 'XS acceleration for JSON',
  -default   => 1,
  'JSON::XS' => 0;

feature 'MooseX::Storage integration',
  -default          => 0,
  'MooseX::Storage' => 0;

feature 'Berkeley DB backend',
  -default                => has_bdb(),
  'BerkeleyDB::Manager'   => 0,
  'KiokuDB::Backend::BDB' => 0;

feature 'DBI backend',
  -default                => has_dbd(),
  'KiokuDB::Backend::DBI' => 0;

feature 'libuuid based UUIDs',
  -default              => has_uuid(),
  'Data::UUID::LibUUID' => 0;

auto_install;
WriteAll;
