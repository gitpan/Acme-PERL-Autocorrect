use Test::More 0.98;

use strict;
use warnings;
use Acme::PERL::Autocorrect;

BEGIN { use_ok( 'Acme::PERL::Autocorrect' ) };

is 'PERL', 'Perl', 'constant PERL should get optimized';
is 'P' . 'ERL', 'Perl', '... as should constant concatenation';
isnt 'PERLISH', 'Perlish', '... but only PERL';

done_testing();
