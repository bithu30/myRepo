<form action="" method="post">
    Search User email (ie: Nicola):  <input type="text" name="username" /><br />
    <input type="submit" value="submit" />
</form>

<?php

//try with: 1' or '1' = '1

if ($_POST) {
    $username = $_POST['username'];

    try {
        $db = new PDO('mysql:host=mysql;dbname=mydb;charset=utf8', 'dev', '123456');
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM user WHERE username='$username'";

        /*
         * if you try to submit the form with: 1' OR '1' = '1
         * it's like to run this query: SELECT * FROM user WHERE username='1' OR '1' = '1'
         * the OR statement does the trick
         */
        //

        foreach ($db->query($sql) as $row) {
            echo '<br/> Username: '.$row['username'].' Email: '.$row['email'];
        }

    } catch(PDOException $e) {
        echo $e->getMessage();
    }
}
?>