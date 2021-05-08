<%@ page import="com.example.todolist.entity.Notes" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Aditya K
  Date: 06-05-2021
  Time: 07:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Todo List</title>
    <%--    ===============================================================================================--%>
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>
<body style=" overflow-x: hidden; overflow-y: scroll;">

<%@include file="common/header.jsp" %>
<%
    List<Notes> listNote = (List<Notes>) request.getSession().getAttribute("notesList");
%>
<div class="limiter" style="margin-left: -5%;">
    <div class="container-table100">
        <div class="wrap-table100">
            <div style="text-align: center">
                <img src="/images/image1.png" alt="" style=" border-radius:20%; height: 100px;width: 100px">
                <h1>Welcome ${userdata.user_fname}</h1>
            </div>
            <a href="/addview">
                <button type="button" class="btn btn-info">Add TODO</button>
            </a>
            <p><strong>NOTE:</strong> All HIGH preference/ priority TO-DO's are shown first in the below table.
           [ Asc => Desc ]</p>
            <hr>

            <div style="background-color:rgba(217,169,61,0.78); color: aliceblue;
                border-radius: 10px;
                border: 2px solid #1b1e21;
                padding: 20px;
                height: 10px;">
                <h2 style="margin-top: -1.8%;">Your Todo List's</h2>
            </div>
            <hr>
            <div class="table100 ver1 m-b-100">
                <div class="table100-head">
                    <table id="tabledata">
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
                        <c:if test="<%= listNote!=null%>">
                            <c:forEach items="<%= listNote %>" var="ln">
                                <tr class="row100 body">
                                    <td class="cell100 column1">${ln.user_note}</td>
                                    <td class="cell100 column2">${ln.create_date}</td>
                                    <td class="cell100 column3">${ln.target_date}</td>
                                    <td class="cell100 column4">
                                        <c:if test="${ln.user_preference==1}">High</c:if>
                                        <c:if test="${ln.user_preference==2}">Medium</c:if>
                                        <c:if test="${ln.user_preference==3}">Low</c:if>
                                    </td>
                                    <td class="cell100 column5">
                                        <form action="/updateserv" method="get" id="form">
                                            <input type="hidden" name="user_note" value="${ln.user_note}">
                                            <input type="hidden" name="create_date" value="${ln.create_date}">
                                            <input type="hidden" name="target_date" value="${ln.target_date}">
                                            <input type="hidden" name="user_preference" value="${ln.user_preference}">
                                            <button type="submit"  class="btn btn-success"
                                                    style="width: 100">Update
                                            </button>
                                        </form>
                                        <form action="/notedelete" method="get" onsubmit=" return check()">
                                            <input type="hidden" name="create_date" value="${ln.create_date}">
                                            <button style="margin-top: 2%;width: 100" type="submit"
                                                    class="btn btn-danger">Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
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
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<%@include file="common/footer.jsp" %>
<script>
    const lo = () => document.getElementById("lout").style.visibility = 'visible';
    document.onload(lo());

    // function checkFun(a) {
    //     if (a === "btn1") {
    //         let elementById = document.getElementById("form");
    //         elementById.setAttribute("action", "/updateserv");
    //     } else {
    //         let elementById = document.getElementById("form");
    //         elementById.setAttribute("action", "/notedelete");
    //     }
    // }
    function check(){
        return confirm("Are You Sure! want to delete it?");;
    }
    function check2(){
        return confirm("Want to logout???");
    }
</script>

</body>
</html>
