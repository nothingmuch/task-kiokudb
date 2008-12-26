#!/usr/bin/perl

package Task::KiokuDB;

use strict;
use warnings;

use 5.008;

our $VERSION = "0.04";

__PACKAGE__

__END__

=pod

=head1 NAME

Task::KiokuDB - Install L<KiokuDB> and related modules.

=head1 SYNOPSIS

	cpan> install Task::KiokuDB

=head1 DESCRIPTION

=head1 MODULES

=over 4

=item L<KiokuDB::Backend::JSPON>

The JSON file backend.

=item L<KiokuDB::Backend::BDB>

L<BerkeleyDB> backend. Requires an installed BerkeleyDB, preferably 4.7.

Defaults to false.

=item L<Data::UUID::LibUUID>

Better UUID generation than L<Data::UUID> (not time based). Requires C<libuuid>
which is available by default on Mac OS X, and easy to install on most Linux
distributions.

Defaults to false.

=back

=head1 LICENSE

MIT

=head1 AUTHOR

Yuval Kogman

=cut
