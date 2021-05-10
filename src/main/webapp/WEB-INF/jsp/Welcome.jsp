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
        #tb1 table,tr,td{
            color: whitesmoke;
            border: 1px solid ghostwhite;
            padding: 8px;
            text-shadow: 2px 2px black;
        }
        .btn{
            position: relative;
        }
        .span1{
            color: ghostwhite;
            transition: all 0.2s;
        }
        .btnSub .span1{
            visibility: hidden;
            opacity: 0;
        }
        .btnSub:after{
            content: "";
            position: absolute;
            width: 18px;
            height: 18px;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            border: 3px solid transparent;
            border-top-color: white;
            border-radius: 50%;
            animation: button-loader-spinner 1s ease infinite;
        }
        @keyframes button-loader-spinner {
            from{
                transform: rotate(0turn);
            }
            to{
                transform: rotate(1turn);
            }
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
    <a href="/signingo"><button type="button" onclick="this.classList.toggle('btnSub')"
                                class="btn btn-primary">
       <span class="span1">Sign-in</span> </button></a>
    <a href="/signupgo"><button type="button" onclick="this.classList.toggle('btnSub')"
                                class="btn btn-success">
        <span class="span1"> Sign-Up</span></button></a>
    <br>
    <div style="color: whitesmoke; text-shadow: 2px 2px black">
        <strong style="color:orangered;">Q. WHAT YOU CAN DO WITH THIS APP?</strong><br>
    <p>
        ToDo App is simple and awesome app to organize your tasks with very easy to use interface. ToDo can help you to make list of your tasks and also you can set Reminder with specific tasks. It reminds you at you specified Time.

        We believe that we only focus on our Today and Tomorrow tasks, which is most important. So we made user interface like that so that it can give you a quick view on your day timeline.
    </p>
    <br>
        <div id="tb1">
            <table>
                <tr>
                    <td> <strong>FUNCTIONS:</strong></td>
                    <td >Add Todo of your daily task</td>
                    <td >Update yor previously added note</td >
                    <td >Delete your note</td>
                    <td >Give your preference/priority to the todo</td>
                    <td >All high priority Todo's are shown first in your todo list</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<%@include file="common/footer.jsp"%>
</body>
</html>
