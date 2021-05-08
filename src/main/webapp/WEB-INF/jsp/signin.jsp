<%--
  Created by IntelliJ IDEA.
  User: Aditya K
  Date: 06-05-2021
  Time: 02:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        html,body{
            background-image: url("https://s3.amazonaws.com/codementor_content/2015-Jan-Week3/design3.jpg");
            background-size: cover;
        }
        #h1{
            color: rgb(191, 210, 226);
            text-shadow: 2px 2px 3px rgb(209, 107, 158);
        }
        .container1{
            color: aliceblue;
            text-shadow: 2px 2px 3px ;
            display: block;
            background-color:rgba(122, 126, 103, 0.747);
            border: 4px;
            box-shadow: 2px 2px 6px rgb(145, 49, 49);
            border-radius: 2%;
            /*margin-top: 60px;*/
            height: 500px;
            width: 300px;
            margin-left: 37%;
        }
        .subContainer{
           margin-left: 2%;
            margin-right: 2%;
        }
        #btn1{
            background-color: rgb(160, 30, 90);
            border-color: yellow;
        }
        #btn1:hover{
            background-color: yellow;
            color: rgb(165, 55, 55);
        }
        #a2{
            color: springgreen;
        }
        #a2:hover {
            color: cornflowerblue;
        }
    </style>
</head>
<body>
<%@include file="common/header.jsp"%>
<div class="container1">
    <h5>${regSuccessMsg}</h5>
    <h6 style="color: #ffc107; text-align: center">${errorMsg}</h6>
    <br>
    <h2 id="h1" align="center">Welcome</h2>
    <form action="/signin" method="post">
        <div class="subContainer">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
            <small id="emailHelp" class="form-text text-muted"><span style="color: whitesmoke;">We'll never share your email with anyone else.</span></small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        <br>
        <button id="btn1" type="submit" class="btn btn-primary">Sign-In</button>

        <p>If your are not SignedUp <a id="a2" href="/signupgo">SignUp Now</a></p>
        <br>
        <p align="center">&COPY;TODO App</p>
        </div>
    </form>

</div>
<br>
<h1>som</h1>
<%@include file="common/footer.jsp"%>
</body>
</html>
