package Person;

use Moose;
use namespace::autoclean;
use DateTime;

has 'name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'birthdate' => (
    is       => 'ro',
    isa      => 'DateTime',
    required => 1,
);

sub age {
    my $self     = shift;
    my $duration = DateTime->now - $self->birthdate;
    return $duration->years;
}

__PACKAGE__->meta->make_immutable;

1;
