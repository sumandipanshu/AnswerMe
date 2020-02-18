#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Scraper' );
}

diag( "Testing Scraper $Scraper::VERSION, Perl $], $^X" );