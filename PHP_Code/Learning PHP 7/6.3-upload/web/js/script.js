$(document).ready(function() {
    $("#postForm").submit(function(e) {
        var data = $("#postForm").serialize();
        console.log(data);
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

});
