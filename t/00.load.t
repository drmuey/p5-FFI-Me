use strict;
use warnings;
use Test::More tests => 47;

BEGIN {
    use_ok('FFI::Me');
}

diag("Testing FFI::Me $FFI::Me::VERSION");

ok( defined &ffi, 'ffi is imported ok' );

for my $type ( FFI::Me::ffi_types() ) {
    no strict 'refs';
    ok( defined &{"ffi::$type"}, "ffi_type $type is available via ffi::" );
    cmp_ok( "ffi::$type"->(), '>', 0, "ffi::$type sanity check: returns value " );
    is( "ffi::$type"->(), "FFI::Raw::$type"->(), "ffi::$type is same as raw version" );
}
