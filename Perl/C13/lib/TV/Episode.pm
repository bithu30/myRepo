package TV::Episode;

use Moose;
use MooseX::StrictConstructor;
use Moose::Util::TypeConstraints;
use namespace::autoclean;
use Carp 'croak';

our $VERSION = '0.01';

subtype 'IntPositive', as 'Int', where { $_ > 0 };

has 'series'         => ( is => 'ro', isa => 'Str',         required => 1 );
has 'director'       => ( is => 'ro', isa => 'Str',         required => 1 );
has 'title'          => ( is => 'ro', isa => 'Str',         required => 1 );
has 'season'         => ( is => 'ro', isa => 'IntPositive', required => 1 );
has 'episode_number' => ( is => 'ro', isa => 'IntPositive', required => 1 );
has 'genre'          => (
    is       => 'ro',
    isa      => enum(qw(comedy drama documentary awesome)),
    required => 1
);

sub as_string {
    my $self = shift;
    my @attributes = map { $_->name } $self->meta->get_all_attributes;

    my $as_string = '';
    foreach my $attribute (@attributes) {
        $as_string .= sprintf "%-14s - %s\n", ucfirst($attribute),
          $self->$attribute;
    }
    return $as_string;
}

__PACKAGE__->meta->make_immutable;

1;
