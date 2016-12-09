$(document).ready(function() {
    $("#postForm").submit(function(e) {
        var data = $("#postForm").serialize();
        $.ajax({
            method: "POST",
            url: this.action,
            data: data
        }).done(function(response) {
            $('#posts-list').prepend(response);
            $("#postModal").modal('toggle');
        }).error(function(response) {
            alert(response.responseText);
        });

        e.preventDefault();
    });

    $('#postModal').on('show.bs.modal', function (e) {
        $("#postForm")[0].reset();
        $('#imagePreview').html('');
        $('#progress .bar').css('width','0%');
    });

    $('#fileupload').fileupload({
        dataType: "json",
        replaceFileInput: false,
        fileInput: $("input:file"),
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
        },
        done: function(e, data) {
            var imgPreview = '<img src="/images/temp/'+data.result.image+'" class="img-responsive">';
            $('#imagePreview').html(imgPreview);
            $('#imageName').val(data.result.image);
        },
        error: function() {
            alert('Image upload failed, please try again.');
        }
    });

    $("#commentForm").submit(function(e) {
        var data = $("#commentForm").serialize();
        $.ajax({
            method: "POST",
            url: this.action,
            data: data
        }).done(function(response) {
            $('#comment-list').prepend(response);
            var postId = $("#commentPostId").val();
            var commentsNum = $('#comments-num-'+postId).html();
            $('#comments-num-'+postId).html(parseInt(commentsNum)+1);
            $("#commentForm")[0].reset();
        }).error(function(response) {
            alert(response.responseText);
        });

        e.preventDefault();
    });

});

function getPostComments(postId) {
    $("#commentPostId").val(postId);
    $.ajax({
        method: "GET",
        url: '/comments/post/'+postId,
        cache: false,
    }).done(function(response) {
        $("#commentsModal").modal('toggle');
        $("#comments").html(response);
    }).error(function(response) {
        alert(response.responseText);
    });
}
