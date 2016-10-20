{
    package Person;

    use Moose;
    use DateTime;
    use My::Company::Moose::Types;

    has 'name' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );
    has 'age' => (
        is       => 'ro',
        isa      => 'MyCompany:18orOlder',
        required => 1,
    );
    has foo => (is => 'ro', isa => 'Bool' );
}

print "This script deliberately generates an error\n\n";

my $youngster = Person->new(
    name => 'Youngster',
    foo => '',
    age  => DateTime->new(
        year  => 2000,
        month => 1,
        day   => 1,
    ),
);
