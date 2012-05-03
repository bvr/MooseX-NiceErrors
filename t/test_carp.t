
use Test::More;
use Carp qw(confess);
use MooseX::NiceErrors;

package MooseError;
use Moose;

has attr => (is => 'ro', isa => 'MooseError');

package main;

MooseError->new(attr => 10);

done_testing;
