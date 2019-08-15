<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<TITLE>粤嵌西安论坛--注册</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script language="javascript">
	function check() {
		if (document.regForm.uName.value == "") {
			alert("用户名不能为空");
			return false;
		}
		if (document.regForm.uPass.value == "") {
			alert("密码不能为空");
			return false;
		}
		if (document.regForm.uPass.value != document.regForm.uPass1.value) {
			alert("2次密码不一样");
			return false;
		}
	}
	function show() {
		var d = new Date();
		document.getElementById("date").innerHTML = d.getYear()
				+ "年&nbsp;&nbsp;" + "" + d.getMonth() + 1 + "月" + d.getDate()
				+ "日&nbsp;&nbsp;" + d.getHours() + ":" + d.getMinutes() + ":"
				+ d.getSeconds();
		setTimeout("show()", 1000);
	}
</script>
</HEAD>
<BODY onload="show()">
	<DIV>
		<IMG src="image/logo.png" style="width:200px;height:50px">
		<div style="text-align:right" id="date"></div>
	</DIV>
	<c:if test="${name==null }">
		<!--      用户信息、登录、注册        -->
		<DIV class="h">
			您尚未 <a href="login.jsp">登录</a> &nbsp;| &nbsp; <A href="reg.jsp">注册</A>
			|
		</DIV>
	</c:if>
	<c:if test="${name!=null }">
		<!--      用户信息、登录、注册        -->
		<DIV class="h">欢迎&nbsp;${name}&nbsp;来到此论坛</DIV>

	</c:if>


	<BR />
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a>
		</B>
	</DIV>
	<!--      用户注册表单        -->
	<DIV class="t" style="MARGIN-TOP: 15px" align="center">
		<FORM name="regForm" onSubmit="return check()"
			action="MemberServlet?flag=register" method="post">
			<br />用&nbsp;户&nbsp;名 &nbsp; <INPUT class="input" tabIndex="1"
				tryp="text" maxLength="20" size="35" name="uName"> <br />密&nbsp;&nbsp;&nbsp;&nbsp;码
			&nbsp; <INPUT class="input" tabIndex="2" type="password"
				maxLength="20" size="40" name="uPass" style="margin-top:2px">
			<br />重复密码 &nbsp; <INPUT class="input" tabIndex="3" type="password"
				maxLength="20" size="40" name="uPass1" style="margin-top:2px">
			<br />所属区域 &nbsp; <select class="input" style="margin-top:2px">
				<option>--请选择省份--</option>
			</select> <select class="input">
				<option>--请选择城市--</option>
			</select> <br />性别 &nbsp; 女<input type="radio" name="gender" value="1">
			男<input type="radio" name="gender" value="2" checked="checked" /> <br />请选择头像
			<br />
			<div class="t" style="WIDTH:50%">
				<img src="image/head/1.gif" /><input type="radio" name="head"
					value="1.gif" checked="checked"> <img
					src="image/head/2.gif" /><input type="radio" name="head"
					value="2.gif"> <img src="image/head/3.gif" /><input
					type="radio" name="head" value="3.gif"> <img
					src="image/head/4.gif" /><input type="radio" name="head"
					value="4.gif"> <img src="image/head/5.gif" /><input
					type="radio" name="head" value="5.gif"> <BR /> <img
					src="image/head/6.gif" /><input type="radio" name="head"
					value="6.gif"> <img src="image/head/7.gif" /><input
					type="radio" name="head" value="7.gif"> <img
					src="image/head/8.gif" /><input type="radio" name="head"
					value="8.gif"> <img src="image/head/9.gif" /><input
					type="radio" name="head" value="9.gif"> <img
					src="image/head/10.gif" /><input type="radio" name="head"
					value="10.gif"> <BR /> <img src="image/head/11.gif" /><input
					type="radio" name="head" value="11.gif"> <img
					src="image/head/12.gif" /><input type="radio" name="head"
					value="12.gif"> <img src="image/head/13.gif" /><input
					type="radio" name="head" value="13.gif"> <img
					src="image/head/14.gif" /><input type="radio" name="head"
					value="14.gif"> <img src="image/head/15.gif" /><input
					type="radio" name="head" value="15.gif"> <br /> 本地头像&nbsp;<input
					type="file" name="file" size="50"
					style="margin-top:2px;margin-bottom:4px">

			</div>
			<INPUT class="btn" tabIndex="4" type="submit" value="注 册">
		</FORM>
	</DIV>
	<!--      声明        -->
	<BR>
	<CENTER class="gray">版权所有 2005-2011 西安粤嵌科技有限公司</CENTER>
</BODY>
</HTML>
