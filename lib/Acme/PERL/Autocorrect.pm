package Acme::PERL::Autocorrect;
BEGIN {
  $Acme::PERL::Autocorrect::VERSION = '1.20110627';
}
# ABSTRACT: corrects PERL to Perl in strings automatically

use strict;
use warnings;

use optimizer 'extend-c' => sub
{
    return unless $_[0]->name eq 'const';
    my $op = shift;
    return unless $op->sv;
    my $sv = $op->sv;
    return unless $op->sv->isa( 'B::PV' );
    my $pv = $op->sv->PV;
    return unless "$pv" eq 'PERL';
    $op->sv( 'Perl' );
};

1;

__END__

=head1 NAME

Acme::PERL::Autocorrect - corrects PERL to Perl

=head1 SYNOPSIS

To use this module, simply:

  use Acme::PERL::Autocorrect;

What could be easier?

=head1 DESCRIPTION

It's not PERL. It's Perl, but why should you have to fix that when Perl can fix
itself?

=head1 AUTHOR

chromatic, C<< <chromatic@wgz.org> >>

=head1 BUGS

This doesn't poke yet into bigger strings which merely I<contain> PERL. Patches
welcome.

=head1 ACKNOWLEDGEMENTS

Chip made me do it.

=head1 COPYRIGHT & LICENSE

Copyright (c) chromatic, 2011, and distributed under the same license as Perl
5.

=cut
