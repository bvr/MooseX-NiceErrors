use strict; use warnings;

package MooseX::NiceErrors;
# ABSTRACT: Removes Moose related packages from Carp's call stack
require Tie::Hash;

our @ISA = qw(Tie::StdHash);

tie %Carp::Internal, __PACKAGE__;

sub FETCH {
    my ($self,$key) = @_;
    # TODO: maybe make the regex configurable
    return $key =~ /^(MooseX?|Class::MOP)::/ ? 1 : $self->{$key};
}

1;
