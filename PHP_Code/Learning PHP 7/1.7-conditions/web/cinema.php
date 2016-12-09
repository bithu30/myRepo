<?php

/**
 * Screen 1: The Godfather, ticket A
 * Screen 2: Star Wars, ticket B
 * Screen 3: Avatar, ticket C
 * Screen 4: Titanic, ticket D
 */

$ticket = 'A';

if ($ticket == 'A') {
    echo 'Please, go to the Screen 1.';
} else {
    echo 'Your ticket is not for the Godfather.';
}

echo $ticket == 'A' ? 'Please, go to the Screen 1.' : 'Your ticket is not for the Godfather.';

if ($ticket == 'A') {
    echo 'Please, go to the Screen 1.';
} elseif ($ticket == 'B') {
    echo 'Please, go to the Screen 2.';
} elseif ($ticket == 'C') {
    echo 'Please, go to the Screen 3.';
} elseif ($ticket == 'D') {
    echo 'Please, go to the Screen 3.';
} else {
    echo 'Sorry, the ticket is not valid';
}

switch($ticket) {
    case 'A':
        echo 'Please, go to the Screen 1.';
        break;
    case 'B':
        echo 'Please, go to the Screen 2.';
        break;
    case 'C':
        echo 'Please, go to the Screen 3.';
        break;
    case 'D':
        echo 'Please, go to the Screen 4.';
        break;
    default:
        echo 'Sorry, the ticket is not valid.';
        break;
}

switch($ticket) {
    case 'A':
    case 'B':
    case 'C':
    case 'D':
        echo 'I am sure the ticket is valid.';
        break;
    default:
        echo 'Sorry, the ticket is not valid.';
}
