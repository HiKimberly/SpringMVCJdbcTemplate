<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
    

    <title>餐廳訂位系統</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/resources/styles/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/javascript/example.js" />"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    

    <!-- Custom CSS -->
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Javascript -->
    <script>
    $(function() {
        $("#datepicker").datepicker({
          //可使用下拉式選單 - 月份
          changeMonth : true,
          //可使用下拉式選單 - 年份
          changeYear : true,
          //設定 下拉式選單月份 在 年份的後面
          showMonthAfterYear : true
        });
    });
    function queryDate(date){
        var d = date.replace(/\//g, "");
        d=d.substring(4,8)+d.substring(0,4);
        document.getElementById("reserveDate").value =  d;
    	
    };
	</script>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><i class="material-icons">restaurant</i>小餐館</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                    <li>
                        <a href="#"></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h1>新增/修改訂位資料</h1>
                <br>
                <!-- Main Content -->

				<div class="form-group-lg " align="center">
					<form:form action="saveBooking" method="post" modelAttribute="reservation" class="form-horizontal" role="form">
					
					
						<form:hidden path="bookingNO"/>
						<!-- <tr>
							<td>訂單編號:</td>
							<td><form:input path="bookingNO" /></td>
						</tr> -->
						<div class="form-group form-group-lg">
						   <div class="col-lg-4"></div>
							<label class="col-sm-1 control-label" for="formGroupInputLarge">姓名</label>
							<div class="col-lg-3">
							    <form:input class="form-control input-lg" path="customer" />
						    </div>
						    <div class="col-lg-4"></div>
						</div>
						<div class="form-group form-group-lg">
						   <div class="col-lg-4"></div>
							<label class="col-sm-1 control-label" for="formGroupInputLarge">日期</label>
							<div class="col-lg-3">
							    <input class="form-control input-lg" id="datepicker" onchange="queryDate(this.value)" value=""/>						   
							    <form:hidden path="reserveDate" id="reserveDate" value=""/>
						    </div>
						    <div class="col-lg-4"></div>
						</div>
						<div class="form-group form-group-lg">
						   <div class="col-lg-4"></div>
							<label class="col-sm-1 control-label" for="formGroupInputLarge">時間</label>
							<div class="col-lg-3">
							    <form:input class="form-control input-lg" path="reserveTime" />
						    </div>
						    <div class="col-lg-4"></div>
						</div>
						<div class="form-group form-group-lg">
						   <div class="col-lg-4"></div>
							<label class="col-sm-1 control-label" for="formGroupInputLarge">電話</label>
							<div class="col-lg-3">
							    <form:input class="form-control input-lg" path="phone" />
						    </div>
						    <div class="col-lg-4"></div>
						</div>
						<div class="form-group form-group-lg">
						   <div class="col-lg-4"></div>
							<label class="col-sm-1 control-label" for="formGroupInputLarge">人數</label>
							<div class="col-lg-3">
							    <form:input class="form-control input-lg" path="amount" />
						    </div>
						    <div class="col-lg-4"></div>
						</div>
						
							
						   <input type="submit" class="btn btn-primary btn-lg" value="送出">
						
				
					</form:form>
				</div>

                <!-- Main Content -->    
                
                
                
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
