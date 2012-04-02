<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.apache.catalina.session.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="js/lib/prototype.js"></script>
<script type="text/javascript" src="js/src/scriptaculous.js?load=effects,controls"></script>
<script type="text/javascript" src="js/src/validation.js"></script>

<link rel="stylesheet" href="css/hclprobs.css"/>

<title>Teaching Tools</title>
</head>
<body>
<div id="login_div">
		<form id="login_form" action="beanLogin.jsp" method="post">
			<fieldset id = "login_fieldset" class="greenfieldset">
				<legend>Teaching Tools Login</legend>
					<div class="form-row">
						<div class="field-label">Email <span class="required_field">* </span></div>
						<div class="field-widget"><input name="email" id="email" class="required validate-email" title="Enter your email"/></div>
					</div>
					<!--
						<p><a href="#" onclick="$('optionalname').toggle(); return false">You can also provide your name</a></p>
						<div id="optionalname" class="form-row" style="display:none;">
							<div class="field-label"><label for="name">Name</label>:</div>
							<div class="field-widget"><input name="name" id="name" class="required-name validate-alpha" title="Optional: First name Last name" />
							</div>
						</div>
					-->
					<div class="form-row">
						<input type="submit" value="Submit" /> 
						<input type="button" value="Reset" onclick="login_validation.reset(); return false" />
					</div>
				</fieldset>
		</form>
</div>
<script type="text/javascript">
Event.observe(window, 'load', function() {
	  $("email").focus();
	});
var login_validation = new Validation('login_form',{ 
								useTitles : false,
								immediate : true
								});
console.log(login_validation);//Monitor the JS
</script>
</body>
</html>