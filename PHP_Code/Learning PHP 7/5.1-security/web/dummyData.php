<?php

echo '<h1>Insert data in database</h1>';


try {
    $db = new PDO('mysql:host=mysql;dbname=mydb;charset=utf8', 'dev', '123456');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $createTableQuery = '
        CREATE TABLE IF NOT EXISTS user (
        id int(11) NOT NULL auto_increment,
        username char(100) NOT NULL,
        email char(100) NOT NULL,
        password char(32) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY email (email)
    );';

    $db->exec($createTableQuery);

    $db->exec("INSERT INTO user (username, email, password) VALUES ('Nicola', 'nicola@test.com','".rand(1,100)."')");


} catch(PDOException $e) {
    echo $e->getMessage();
}

//INSERT A VALUE
$db->exec("INSERT INTO user (username, email, password) VALUES ('".getFakeUserName()."','".getFakeEmail()."','".rand(1,100)."')");

function getFakeEmail() : string
{
    return 'user'.rand(1,1000).'@email.com';
}

function getFakeUserName() : string
{
    return 'user'.rand(1,1000);
}
