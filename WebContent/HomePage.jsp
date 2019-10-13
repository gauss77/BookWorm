<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Website Home</title>
<!-- Add jquery global library -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<style><%@include file="/WEB-INF/css/home.css"%></style>
<script type="text/javascript">

	$(document).ready(function(){
		if(sessionStorage.getItem("error")){
		document.getElementById('error-message').innerHTML = sessionStorage.getItem("error");
		sessionStorage.setItem("error", "");
		}
		$('#searchButton').click(function(){
		const apiKey = 'AIzaSyA1kVp-7zFSlHYfkXNYM5cuTsR_aZ0M0O8';
		var searchType = $('form input[type=radio]:checked').val();
		var searchKeywords = $('#searchKeywords').val();
		searchKeywords = searchKeywords.split(' ').join('+');
		var baseURL = 'https://www.googleapis.com/books/v1/volumes?q=';
		if(searchType && searchType!=='') {
			baseURL = baseURL.concat('+').concat(searchType).concat(':').concat(searchKeywords);
		} else {
			baseURL = baseURL.concat(searchKeywords);
		}
		sessionStorage.setItem("url", baseURL);
		sessionStorage.setItem("searchKeywords", searchKeywords);
		console.log(sessionStorage.getItem('url'));
		window.location="SearchResults.jsp";
	})
});
</script>

<div class="header">
	<a href="HomePage.jsp"><img class="img-bookworm" alt="bookworm" src="bookworm.png" alt="alt text" /></a>
</div>
</head>
<body>  
<div class="content">
	<div class="bg-image"></div>
	
	<h1>BookWorm: Just a Mini Program... Happy Days!</h1>
	<form id="searchForm"  method="post" action="SearchResults.jsp" >
		<div class="search-field">
			<input placeholder="Search for your favorite book!" type="text" id="searchKeywords">
		</div>
		<div class="select-choices">
			<div> 
					<span class="input-1"><input type="radio" name="searchType" value="intitle"> Name</span>
					<span class="input-2"><input type="radio" name="searchType" value="isbn"> ISBN</span>
			</div>
			<div> 
					<span class="input-3"><input type="radio" name="searchType" value="inauthor"> Author</span>
					<span class="input-4"><input type="radio" name="searchType" value="inpublisher"> Publisher</span>	
			</div>  
		 	<input type="button" id="searchButton" value="Search!">
		</div> 
	</form>    
</div>    
	<span id="error-message"></span> 
    
</body>  
</html>