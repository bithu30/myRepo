$(document).ready(function() {
    var tab_get = $("#projects_nav_get");
    var tab_post = $("#projects_nav_post");

    var get_content = $("#projects_get");
    var post_content = $("#projects_post");

    $(tab_get).bind("click", function(e){
        $(tab_get).addClass("active");
        $(tab_post).removeClass("active");
        $(post_content).hide();
        $(get_content).show();
    });

    $(tab_post).bind("click", function(e){
        $(tab_get).removeClass("active");
        $(tab_post).addClass("active");
        $(get_content).hide();
        $(post_content).show();
    });
});

function saveProject() {
    var projectName = $("#projectName").val();
    var projectDescription = $("#projectDescription").val();

    var success_alert = $("#success_alert");

    $.post("/api/project", {name: projectName, description: projectDescription}, function(response){
        console.log(response.id);

        $(success_alert).find("#success_message").text("Project successfully created with ID:" + response.id);
        $(success_alert).removeClass("hidden");
    });
}


function loadProjects() {
    var table = $("#projects_table");

    //
    // clear table
    //
    $(table).empty();

    $.get('/api/project/random/5', function(response){
        var projects = response.projects;

        for(var i=0; i<projects.length; i++){
            var currentItem = projects[i];
            if(i===0) {
                var heading = $("<tr></tr>");
                for(var key in currentItem) {
                    var newHeading = $("<th></th>");
                    $(newHeading).text(key);
                    $(heading).append(newHeading);
                }
                $(table).append(heading);
            }

            var newRow = $("<tr></tr>");
            for(var prop in currentItem) {
                var newCell = $("<td></td>");

                if(Date.parse(currentItem[prop])) {
                    $(newCell).text((new Date(Date.parse(currentItem[prop]))).toDateString());
                }
                else {
                    $(newCell).text(currentItem[prop].toString());
                }
                $(newRow).append(newCell);
            }
            $(table).append(newRow);
        }
    });
}
