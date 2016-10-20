package My::Company::Moose::Types;

use Moose::Util::TypeConstraints;
use DateTime;

subtype 'MyCompany:NonNegativeInteger'
    => as      'Int'
    => where   { $_ >= 0 }
    => message { "You must provide a non-negative integer, not $_" };

subtype 'MyCompany:18orOlder'
    => as      'DateTime'
    => where   { ( DateTime->now - $_ )->years >= 18 }
    => message { 
        my $age = ( DateTime->now - $_ )->years;
        "DateTime supplied must be 18 years old or older, not $age years"
    };

1;
