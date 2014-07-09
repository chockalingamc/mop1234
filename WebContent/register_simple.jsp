<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>TEST - Create New Customer Account - Simple Layout</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>
	<h1>Create an Account</h1>
	<form action="Register" method="post">
		<div>
			<input type="hidden" name="simple" value="true"/>
			<input type="hidden" name="success_url" value=""/>
			<input type="hidden" name="error_url" value=""/>
		</div>
		<table>
			<tr>
				<td><label for="firstname"><sup style="color:red;">*</sup> First Name </label></td>
				<td><input type="text" id="firstname" name="firstname" title="First Name" size="50" value="" maxlength="255"/></td>
			</tr>
			<tr>
				<td><label for="lastname"><sup style="color:red;">*</sup> Last Name </label></td>
				<td><input type="text" id="lastname" name="lastname" title="Last Name" size="50" value="" maxlength="255"/></td>
			</tr>
			<tr>
				<td><label for="email_address"><sup style="color:red;">*</sup> Email Address </label></td>
				<td><input type="text" id="email_address" name="email" title="Email Address" size="50" value=""/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" id="is_subscribed" name="is_subscribed" title="Sign Up for Newsletter" value=""/>
					<label for="is_subscribed">Sign up for news letter</label>
				</td>
			</tr>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td><label for="password"><sup style="color:red;">*</sup> Password </label></td>
				<td><input type="password" id="password" name="password" title="Password" size="50"/></td>
			</tr>
			<tr>
				<td><label for="confirmation"><sup style="color:red;">*</sup> Confirm Password </label></td>
				<td><input type="password" id="confirmation" name="confirmation" title="Confirm Password" size="50"/></td>
			</tr>
		</table>
		<p>
			<button type="submit" title="Create a new account">Submit</button>
		</p>
		<div><sup style="color:red;">*</sup> Required Fields</div>
	</form>
	<hr/>
	<c:if test='${result ne null and "SUCCESS" eq result}'>
		<div id="successDiv" style="font-weight:bold;color:green;">
			<c:out escapeXml="false" value="${message}"/><br/>
			Click here to <a href="<c:out escapeXml="false" value="${location}"/>">Login</a>.
		</div>
	</c:if>
	<c:if test='${result ne null and "FAILURE" eq result}'>
		<div id="errorDiv" style="font-weight:bold;color:red;">
			Error in creating a new account
		</div>
		<div>
			<c:out escapeXml="false" value="${message}"/>
		</div>
	</c:if>
</body>
</html>