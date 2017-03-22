<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <!-- link href="css/bootstrap.min.css" rel="stylesheet"> -->
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
        document.getElementById("QueryBtn").href = "selectReservation?datepicker=" + d;
    	
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

   
          <div class="col-lg-2"></div>
          <div class="col-lg-8 text-center">
              <h1>餐廳訂位系統</h1>
              <br>
              <div class="col-lg-2"></div>
              <div class="col-lg-8">
            <div class="col-lg-8" >
			    <!-- <p class="lead"> -->
			    <input type="text" id="datepicker" class="form-control" onchange="queryDate(this.value)" value="請輸入訂位日期"/>
			    
			</div>
			<div class="col-lg-4" >
			    <a href="" id="QueryBtn" class="btn btn-info btn-md">
                    <i class="material-icons">search</i>
                </a>
			    <a href="newReservation" id="NewBookingBtn" class="btn btn-info btn-md">
                    <i class="material-icons" >event</i>
			    </a>
			    <!-- </p> -->
			    <!-- <a href="index">樣式測試</a> -->
			    
	        </div>
        </div>
	    <div class="col-lg-2"></div>
                
                
                
                
        <!--.result-->
        
    	<div class="col-lg-12">
	        <!-- <h3><a href="newContact">New Contact</a></h3> -->
		    <br>
		    <hr></hr>
		    <br>
			<table border="1" class="table table-lg">
	        	<!-- <th>No</th>  -->
	        	<thead>
	        	<tr > 
	        	    <th class="text-center">#</th>
		        	<th class="text-center">訂位人</th>
		        	<th class="text-center">預約日期/時間</th>
		        	<th class="text-center">電話</th>
		        	<th class="text-center">人數</th>
		        	<th class="text-center">取消訂位/修改訂單</th>
	        	</tr>
	        	</thead>
	            <tbody>
					<c:forEach var="Reserve" items="${listReserve}" varStatus="status">
		        	<tr class="text-center">
		        	    <td> ${status.index+1}</td>
						<td>${Reserve.customer}</td>
						<td>${Reserve.reserveDate}/${Reserve.reserveTime}</td>
						<td>${Reserve.phone}</td>
						<td>${Reserve.amount}</td>	
						<td>
						   <a href="deleteBooking?bookingNO=${Reserve.bookingNO}">
		        	            <i class="material-icons">highlight_off</i>
		        	        </a>
						    <a href="editBooking?bookingNO=${Reserve.bookingNO}">
						        <i class="material-icons">mode_edit</i>
						    </a>
						</td>
						
		        	</tr>
					</c:forEach>
			    </tbody>	         	
			</table>
			
    	</div>
        
        <!--.result -->
              
              
                
            </div>
            <div class="col-lg-2"></div>
       
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
