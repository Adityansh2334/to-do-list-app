<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.6.0/css/bootstrap.min.css">
    <script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
    <title></title>
    <style>
        footer{
            position:absolute;
            left:0;
            bottom:0;
            height:50px;
            width:100%;
        }
        #content {
            padding-bottom: 100px;
            /* Height of the footer element */
        }
        #header {

            padding: 10px;
        }
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            position: relative;
        }

    </style>
</head>
<body>
<nav id="header" class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="http://todo-list.ch/wp-content/uploads/2016/10/logo_script_blue_00-1.png" width="100" height="50" alt="">
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/welcome" onclick=" return check2()">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item" id="lout" style="visibility: hidden;">
                <a class="nav-link" href="/{}/logout" tabindex="-1" style="color: #bd4147">Logout</a>
            </li>
        </ul>
        <form action="/search" method="get" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" name="searchitem" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
</body>
</html>