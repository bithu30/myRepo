<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>

<%--<html>--%>
<%--<head>--%>
    <%--<script type="text/javascript" language="javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>--%>
    <%--<script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>--%>

    <%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
    <%--<title>Spring Jquery Ajax Demo</title>--%>
    <%--<style>--%>
        <%--Table.GridOne {--%>
            <%--padding: 3px;--%>
            <%--margin: 0;--%>
            <%--background: lightyellow;--%>
            <%--border-collapse: collapse;--%>
            <%--width:35%;--%>
        <%--}--%>
        <%--Table.GridOne Td {--%>
            <%--padding:2px;--%>
            <%--border: 1px solid #ff9900;--%>
            <%--border-collapse: collapse;--%>
        <%--}--%>
    <%--</style>--%>
    <%--<script type="text/javascript">--%>

        <%--$(document).ready(function()--%>
        <%--{--%>
            <%--$("#employeeForm").submit(function(e)--%>
            <%--{--%>
                <%--var postData = $(this).serializeArray();--%>
                <%--//var formURL = $(this).attr("action");--%>

                <%--$.ajax({--%>
                    <%--url : 'http://core.climateireland.ie/user/login',--%>
                    <%--type: "post",--%>
                    <%--cache: false,--%>
                    <%--data : postData,--%>
                    <%--success:function(data, textStatus, jqXHR)--%>
                    <%--{--%>
                        <%--$('#result').html("");--%>
                        <%--var obj = JSON.parse(data);--%>
                        <%--alert(data);--%>
                        <%--$('#result').html("First Name:- " + obj.firstName +"</br>Last Name:- " + obj.lastName  + "</br>Email:- " + obj.email);--%>

                        <%--//alert("ok"+data);--%>
                    <%--},--%>
                    <%--error: function(jqXHR, textStatus, errorThrown)--%>
                    <%--{--%>
                        <%--alert('fuck');--%>
                    <%--}--%>
                <%--});--%>

                <%--e.preventDefault(); //STOP default action--%>
                <%--e.unbind(); //unbind. to stop multiple form submit.--%>
            <%--});--%>
        <%--})--%>
    <%--</script>--%>
<%--</head>--%>
<%--<body>--%>

<%--<form id="employeeForm" action="http://core.climateireland.ie/user/login" method="post">--%>
    <%--<table cellpadding="0" cellspacing="0" border="1" class="GridOne">--%>
        <%--<tr>--%>
            <%--<td>First Name</td>--%>
            <%--<td><input type="text" name="firstName" id="firstName" value="" /></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Last Name</td>--%>
            <%--<td><input type="text" name="lastName" id="lastName" value=""></td>--%>
        <%--</tr>--%>

        <%--<tr>--%>
            <%--<td>password</td>--%>
            <%--<td><input type="text" name="password" id="password" value=""></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Email</td>--%>
            <%--<td><input type="text" name="email" id="email" value=""></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td colspan="2" align="center"><input type="submit" value="Ajax Submit" ></td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</form>--%>
<%--<h1>Spring Framework Jquery Ajax Demo</h1>--%>
<%--<div id="result"></div>--%>
<%--</body>--%>
<%--</html>--%>