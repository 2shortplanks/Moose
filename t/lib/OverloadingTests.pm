package OverloadingTests;

use strict;
use warnings;

use Test::More 0.88;
use Devel::OverloadInfo 0.004 'is_overloaded';

sub test_overloading_for_package {
    my $package = shift;

    ok(
        is_overloaded($package),
        "$package is overloaded"
    );
    ok(
        overload::Method( $package, q{""} ),
        "$package overloads stringification"
    );
}

sub test_no_overloading_for_package {
    my $package = shift;

    ok(
        !is_overloaded($package),
        "$package is not overloaded"
    );
    ok(
        !overload::Method( $package, q{""} ),
        "$package does not overload stringification"
    );
}

sub test_overloading_for_object {
    my $class = shift;
    my $thing = shift || "$class object";

    my $object = ref $class ? $class : $class->new( { message => 'foo' } );

    is(
        "$object",
        'foo',
        "$thing stringifies to value of message attribute"
    );
}

1;
