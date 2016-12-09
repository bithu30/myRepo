<?php

define (PHP_LOVE, 'I love PHP ');

echo PHP_LOVE;
echo PHP_LOVE;
echo PHP_LOVE;

for ($i = 0; $i < 3; $i++) {
    echo PHP_LOVE;
}

for ($i = 0; $i < 3; $i++) {
    if ($i == 2) {
        break;
    }
    echo PHP_LOVE;
}

$i = 0;
while ($i < 3) {
    echo PHP_LOVE;
    $i++;
}

$i = 0;
do {
   echo PHP_LOVE;
   $i++;
} while ($i < 3);

$phrases = ['Hi,', ' I am really happy', ' to learn PHP7'];
foreach ($phrases as $phrase) {
    echo $phrase;
}

$cars = [
    'lamborghini' => 'diablo',
    'ferrari' => 'F40'
];
foreach ($cars as $key => $value) {
  echo 'brand:'. $key . ' model:' . $value;
}
