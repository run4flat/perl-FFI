#!perl
# Simple library load test, make sure all the Perl code properly compiles and
# all the XS code properly links.

use Test::More tests => 2;

BEGIN {
    use_ok( 'FFI' ) or BAIL_OUT('Unable to load FFI!');
    use_ok( 'FFI::Library' ) or diag('Unable to load FFI::Library!');
}
