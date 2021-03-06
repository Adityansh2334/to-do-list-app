<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.joda.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Aditya K
  Date: 07-05-2021
  Time: 08:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Update</title>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
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
<body style=" overflow-x: hidden; overflow-y: scroll;">
<%@include file="common/header.jsp" %>
<%
    String s1 = (String) request.getAttribute("s1");
    String s2 = (String) request.getAttribute("s2");

    String pattern = "yyyy-MMMMM-dd hh:mm";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
    String date = simpleDateFormat.format(new LocalDate().toDateTimeAtCurrentTime().toDate());
    String defaultTodo;
    String crDate;
    String btName;
    String action;
    String method;
    if(s1.equals("null") && s2.equals("null")){
        crDate=date;
        defaultTodo="Write your todo";
        btName="Save";
        method="post";
        action="/savenote";
    }else{
        defaultTodo=s1;
        crDate=s2;
        method="post";
        btName="Update";
        action="/noteupdate";
    }

%>
<div class="limiter" style="margin-left: -5%;">
    <div class="container-table100">
        <div class="wrap-table100">
            <div style="text-align: center">
                <img src="${userdata.user_image}" alt="" style=" border-radius:20%; height: 100px;width: 100px">
                <h1>Manage Your Todo List's</h1>
            </div>
            <a href="/backtoView"><button type="button" onclick="this.classList.toggle('btnSub')"
                                          class="btn btn-info">
            <span class="span1">Back</span>
            </button></a>
            <hr>

            <div style="background-color:rgba(217,169,61,0.78); color: aliceblue;
                border-radius: 10px;
                border: 2px solid #1b1e21;
                padding: 20px;
                height: 10px;">
                <h2 style="margin-top: -1.8%;">Your Todo List's</h2>
            </div>
            <hr>
            <div class="table100 ver1 m-b-80">
                <div class="table100-head">
                    <table>
                        <thead>
                        <tr class="row100 head">
                            <th class="cell100 column1">Descriptions</th>
                            <th class="cell100 column2">Created On</th>
                            <th class="cell100 column3">Target Date</th>
                            <th class="cell100 column4">Preference</th>
                            <th class="cell100 column5">Operations</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="table100-body js-pscroll">
                    <table>
                        <tbody>
                        <tr class="row100 body">
                            <td  class="cell100 column1"><textarea style="width:90%" id="td1" ><%=defaultTodo%></textarea></td>
                            <td id="td2"`class="cell100 column2">
                                    <%= crDate %>
                            </td>
                            <td  class="cell100 column3"><input type="datetime-local" id="td3" required></td>
                            <td class="cell100 column4">
                                <div class="form-check">
                                    <input class="form-check-input"value="1" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        High
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" value="2" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Medium
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" value="3" type="radio" name="flexRadioDefault" id="flexRadioDefault3" >
                                    <label class="form-check-label" for="flexRadioDefault3">
                                        Low
                                    </label>
                                </div>
                            </td>
                            <td class="cell100 column5">
                                <form action="<%= action %>" method="<%= method%>" onsubmit="doWork()">
                                    <input type="hidden" id="in1" name="user_note" value="">
                                    <input type="hidden"  name="create_date" value="<%= crDate%>">
                                    <input type="hidden" id="in3" name="target_date" value="">
                                    <input type="hidden" id="in4" name="user_preference" value="">
                                    <button type="submit" onclick="this.classList.toggle('btnSub')"
                                            class="btn btn-success">
                                    <span class="span1"><%= btName %></span>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('.js-pscroll').each(function () {
        var ps = new PerfectScrollbar(this);

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<script>
    const lo = () => document.getElementById("lout").style.visibility = 'visible';
    document.onload(lo());
    function doWork(){
        document.getElementById("in1").setAttribute("value",document.getElementById("td1").value);
        let v1= document.querySelector("input[type='datetime-local']").value;
        document.getElementById("in3").setAttribute("value",v1);
        let ele=document.getElementsByName("flexRadioDefault");
        let temp=0;
        for (let i=0;i<ele.length;i++){
            if(ele[i].checked){
                document.getElementById("in4").setAttribute("value",ele[i].value);
                temp++;
            }
        }
        if(temp===0)window.alert("Please Select Any Preference");
    }
    function check2(){
        return confirm("Want to logout???");
    }
</script>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<%@include file="common/footer.jsp" %>

</body>
</html>