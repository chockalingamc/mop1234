<!-- mop1234 : JSTL tag library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0066)http://myopenissues.com/magento/index.php/customer/account/create/ -->

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<!-- mop1234 : updated title -->
	<title>TEST - Create New Customer Account</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Default Description"/>
	<meta name="keywords" content="Magento, Varien, E-commerce"/>
	<meta name="robots" content="*"/>

	<link rel="icon" href="http://myopenissues.com/magento/skin/frontend/default/default/favicon.ico" type="image/x-icon"/>
	<link rel="shortcut icon" href="http://myopenissues.com/magento/skin/frontend/default/default/favicon.ico" type="image/x-icon"/>
	
<!--[if lt IE 7]>
<script type="text/javascript">
//<![CDATA[
    var BLANK_URL = 'http://myopenissues.com/magento/js/blank.html';
    var BLANK_IMG = 'http://myopenissues.com/magento/js/spacer.gif';
//]]>
</script>
<![endif]-->
	
	<link rel="stylesheet" type="text/css" href="./magento_files/styles.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="./magento_files/widgets.css" media="all"/>
	<link rel="stylesheet" type="text/css" href="./magento_files/print.css" media="print"/>
	
	<!-- mop1234 : removed JS file includes -->
	<!-- <script type="text/javascript" src="./magento_files/prototype.js"></script>
	<script type="text/javascript" src="./magento_files/ccard.js"></script>
	<script type="text/javascript" src="./magento_files/validation.js"></script>
	<script type="text/javascript" src="./magento_files/builder.js"></script>
	<script type="text/javascript" src="./magento_files/effects.js"></script>
	<script type="text/javascript" src="./magento_files/dragdrop.js"></script>
	<script type="text/javascript" src="./magento_files/controls.js"></script>
	<script type="text/javascript" src="./magento_files/slider.js"></script>
	<script type="text/javascript" src="./magento_files/js.js"></script>
	<script type="text/javascript" src="./magento_files/form.js"></script>
	<script type="text/javascript" src="./magento_files/menu.js"></script>
	<script type="text/javascript" src="./magento_files/translate.js"></script>
	<script type="text/javascript" src="./magento_files/cookies.js"></script>
	<script type="text/javascript" src="./magento_files/captcha.js"></script>  -->

<!--[if lt IE 8]>
<link rel="stylesheet" type="text/css" href="http://myopenissues.com/magento/skin/frontend/default/default/css/styles-ie.css" media="all" />
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="http://myopenissues.com/magento/js/lib/ds-sleight.js"></script>
<script type="text/javascript" src="http://myopenissues.com/magento/skin/frontend/base/default/js/ie6.js"></script>
<![endif]-->

<!-- mop1234 : removed script -->
<!-- 
<script type="text/javascript">
//<![CDATA[
	Mage.Cookies.path     = '/magento';
	Mage.Cookies.domain   = '.myopenissues.com';
//]]>
</script>
<script type="text/javascript">
//<![CDATA[
	optionalZipCountries = ["HK","IE","MO","PA"];
//]]>
</script>
<script type="text/javascript">
//<![CDATA[
	var Translator = new Translate([]);
//]]>
</script>
-->

<!-- mop1234 : styles for displaying banners -->
<style type="text/css">
	.banner {background:yellow;text-align:center;font-weight:bold;font-size:xx-large;}
	.success {background:green;}
	.failure {background:red;}
</style>
</head>

<body class=" customer-account-create">
	<div class="wrapper">
		<noscript>
			&lt;div class="global-site-notice noscript"&gt;
				&lt;div class="notice-inner"&gt;
					&lt;p&gt;
                    	&lt;strong&gt;JavaScript seems to be disabled in your browser.&lt;/strong&gt;&lt;br /&gt;
						You must have JavaScript enabled in your browser to utilize the functionality of this website.
					&lt;/p&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		</noscript>
		<div class="page">
			<div class="header-container">
				<div class="header">
					<a href="http://myopenissues.com/magento/index.php/" title="Magento Commerce" class="logo"><strong>Magento Commerce</strong><img src="./magento_files/logo.gif" alt="Magento Commerce"/></a>
					<div class="quick-access">
			            <form id="search_mini_form" action="http://myopenissues.com/magento/index.php/catalogsearch/result/" method="get">
							<div class="form-search">
								<label for="search">Search:</label>
								<input id="search" type="text" name="q" value="" class="input-text" maxlength="128" autocomplete="off"/>
								<button type="submit" title="Search" class="button"><span><span>Search</span></span></button>
								<div id="search_autocomplete" class="search-autocomplete" style="display: none;"></div>
<!-- mop1234 : removed script -->
<!-- <script type="text/javascript">
//<![CDATA[
	var searchForm = new Varien.searchForm('search_mini_form', 'search', 'Search entire store here...');
	searchForm.initAutocomplete('http://myopenissues.com/magento/index.php/catalogsearch/ajax/suggest/', 'search_autocomplete');
//]]>
</script>
-->
							</div>
						</form>
						<p class="welcome-msg">Default welcome msg! </p>
						<ul class="links">
							<li class="first"><a href="http://myopenissues.com/magento/index.php/customer/account/" title="My Account">My Account</a></li>
							<li><a href="http://myopenissues.com/magento/index.php/wishlist/" title="My Wishlist">My Wishlist</a></li>
							<li><a href="http://myopenissues.com/magento/index.php/checkout/cart/" title="My Cart" class="top-link-cart">My Cart</a></li>
							<li><a href="http://myopenissues.com/magento/index.php/checkout/" title="Checkout" class="top-link-checkout">Checkout</a></li>
							<li class=" last"><a href="http://myopenissues.com/magento/index.php/customer/account/login/" title="Log In">Log In</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="main-container col1-layout">
				<div class="main">
					<!-- mop1234 : added banner to indicate this is a duplicate site -->
					<div class="banner">
						This is a DUPLICATE site
					</div>
					<div class="col-main">
						<div class="account-create">
							<div class="page-title">
								<h1>Create an Account</h1>
							</div>
							<!-- mop1234 : changed the form action to point to the Register Servlet that sits in between this JSP and the source site -->
							<form action="Register" method="post" id="form-validate">
								<div class="fieldset">
									<input type="hidden" name="success_url" value=""/>
									<input type="hidden" name="error_url" value=""/>
									<h2 class="legend">Personal Information</h2>
									<ul class="form-list">
										<li class="fields">
											<div class="customer-name">
												<div class="field name-firstname">
													<label for="firstname" class="required"><em>*</em>First Name</label>
													<div class="input-box">
														<input type="text" id="firstname" name="firstname" value="" title="First Name" maxlength="255" class="input-text required-entry"/>
													</div>
												</div>
			    								<div class="field name-lastname">
			        								<label for="lastname" class="required"><em>*</em>Last Name</label>
			        								<div class="input-box">
			            								<input type="text" id="lastname" name="lastname" value="" title="Last Name" maxlength="255" class="input-text required-entry"/>
			       									</div>
			   								 	</div>
											</div>
			                			</li>
			               				<li>
			                    			<label for="email_address" class="required"><em>*</em>Email Address</label>
			                    			<div class="input-box">
			                        			<input type="text" name="email" id="email_address" value="" title="Email Address" class="input-text validate-email required-entry"/>
			                    			</div>
			                			</li>
										<li class="control">
											<div class="input-box">
												<input type="checkbox" name="is_subscribed" title="Sign Up for Newsletter" value="1" id="is_subscribed" class="checkbox"/>
											</div>
											<label for="is_subscribed">Sign Up for Newsletter</label>
										</li>
									</ul>
								</div>
								<div class="fieldset">
									<h2 class="legend">Login Information</h2>
									<ul class="form-list">
										<li class="fields">
											<div class="field">
												<label for="password" class="required"><em>*</em>Password</label>
												<div class="input-box">
													<input type="password" name="password" id="password" title="Password" class="input-text required-entry validate-password"/>
												</div>
											</div>
											<div class="field">
												<label for="confirmation" class="required"><em>*</em>Confirm Password</label>
												<div class="input-box">
													<input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword"/>
												</div>
											</div>
										</li>
									</ul>
<!-- mop1234 : removed script -->
<!-- 
<script type="text/javascript">
//<![CDATA[
	function toggleRememberMepopup(event){
		if($('remember-me-popup')){
			var viewportHeight = document.viewport.getHeight(),
				docHeight      = $$('body')[0].getHeight(),
				height         = docHeight > viewportHeight ? docHeight : viewportHeight;
			$('remember-me-popup').toggle();
			$('window-overlay').setStyle({ height: height + 'px' }).toggle();
		}
		Event.stop(event);
	}
	document.observe("dom:loaded", function() {
		new Insertion.Bottom($$('body')[0], $('window-overlay'));
		new Insertion.Bottom($$('body')[0], $('remember-me-popup'));
		$$('.remember-me-popup-close').each(function(element){
			Event.observe(element, 'click', toggleRememberMepopup);
		})
		$$('#remember-me-box a').each(function(element) {
			Event.observe(element, 'click', toggleRememberMepopup);
		});
	});
//]]>
</script>
-->
			        			</div>
			        			<div class="buttons-set">
			            			<p class="required">* Required Fields</p>
			            			<p class="back-link">
			            				<a href="http://myopenissues.com/magento/index.php/customer/account/login/" class="back-link"><small>&lt;&lt; </small>Back</a>
			            			</p>
			            			<button type="submit" title="Submit" class="button"><span><span>Submit</span></span></button>
								</div>
							</form>
<!-- mop1234 : removed script -->
<!--
<script type="text/javascript">
//<![CDATA[
	var dataForm = new VarienForm('form-validate', true);
//]]>
</script>
-->
						</div>
					</div>
<!-- -------------------------------------------------------------------------------------------------------------------- -->					
					<!-- mop1234 : show success or failure message based on attributes set in the request -->
					<c:if test='${result ne null and "SUCCESS" eq result}'>
						<div id="successDiv" class="banner success">
							<c:out escapeXml="false" value="${message}"/><br/>
							Click here to <a href="<c:out escapeXml="false" value="${location}"/>">Login</a>.
						</div>
					</c:if>
					<c:if test='${result ne null and "FAILURE" eq result}'>
						<div id="errorDiv" class="banner failure">
							Error in creating a new account
						</div>
						<div>
							<c:out escapeXml="false" value="${message}"/>
						</div>
					</c:if>
<!-- -------------------------------------------------------------------------------------------------------------------- -->					
				</div>
			</div>
	        <div class="footer-container">
	    		<div class="footer">
	        		<ul>
						<li><a href="http://myopenissues.com/magento/index.php/about-magento-demo-store">About Us</a></li>
						<li><a href="http://myopenissues.com/magento/index.php/customer-service">Customer Service</a></li>
						<li class="last privacy"><a href="http://myopenissues.com/magento/index.php/privacy-policy-cookie-restriction-mode">Privacy Policy</a></li>
					</ul>
					<ul class="links">
						<li class="first"><a href="http://myopenissues.com/magento/index.php/catalog/seo_sitemap/category/" title="Site Map">Site Map</a></li>
						<li><a href="http://myopenissues.com/magento/index.php/catalogsearch/term/popular/" title="Search Terms">Search Terms</a></li>
						<li><a href="http://myopenissues.com/magento/index.php/catalogsearch/advanced/" title="Advanced Search">Advanced Search</a></li>
						<li><a href="http://myopenissues.com/magento/index.php/sales/guest/form/" title="Orders and Returns">Orders and Returns</a></li>
						<li class=" last"><a href="http://myopenissues.com/magento/index.php/contacts/" title="Contact Us">Contact Us</a></li>
					</ul>
					<p class="bugs">Help Us to Keep Magento Healthy - <a href="http://www.magentocommerce.com/bug-tracking" onclick="this.target='_blank';"><strong>Report All Bugs</strong></a> (ver. 1.8.1.0)</p>
					<address>© 2013 Magento Demo Store. All Rights Reserved.</address>
				</div>
			</div>
		</div>
	</div>
	<div id="window-overlay" class="window-overlay" style="display:none;"></div>
	<div id="remember-me-popup" class="remember-me-popup" style="display:none;">
    	<div class="remember-me-popup-head">
        	<h3>What's this?</h3>
        	<a href="http://myopenissues.com/magento/index.php/customer/account/create/#" class="remember-me-popup-close" title="Close">Close</a>
		</div>
		<div class="remember-me-popup-body">
			<p>Checking "Remember Me" will let you access your shopping cart on this computer when you are logged out</p>
			<div class="remember-me-popup-close-button a-right">
				<a href="http://myopenissues.com/magento/index.php/customer/account/create/#" class="remember-me-popup-close button" title="Close"><span>Close</span></a>
			</div>
		</div>
	</div>
</body>
</html>