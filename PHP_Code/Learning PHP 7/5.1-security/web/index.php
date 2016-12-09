Add a comment below:
<form action="" method="post">
    <textarea cols="20" rows="5" name="comment"></textarea><br/>
    <input type="submit" value="submit" />
</form>


<?php


if ($_POST) {
    $comment = $_POST['comment'];

    //$comment = htmlEntities($comment, ENT_QUOTES);

    echo "Your last comment is: $comment";

    //try to insert this: <script>alert('you are under attack')</script>
}
