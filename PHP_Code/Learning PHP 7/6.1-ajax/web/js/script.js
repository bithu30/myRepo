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
    });
});
