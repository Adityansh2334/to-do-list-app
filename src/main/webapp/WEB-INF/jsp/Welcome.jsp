<%--
  Created by IntelliJ IDEA.
  User: Aditya K
  Date: 06-05-2021
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body{
            background-image: url("https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wtcU?ver=943b");
            background-size: cover;

        }
        h2{
            color: #fdfdfe;
            text-shadow: 0px 2px 3px #1b1e21 ;
        }
    </style>
</head>
<body>
<%@include file="common/header.jsp"%>
<div  id="content" class="container" style="text-align: center;">
    <img src="https://media.tenor.com/images/4b5e1d70a721bbe2d7dac1119e91fa2c/tenor.gif" width="100" height="100" alt="">
    <h2>Welcome <br> TO <br> Todo Application-2021</h2>
    <br>
    <br>
    <a href="/signingo"><button type="button" class="btn btn-primary">Sign-in</button></a>  <a href="/signupgo"><button type="button" class="btn btn-success">Sign-Up</button></a>
</div>

<%@include file="common/footer.jsp"%>
</body>
</html>
