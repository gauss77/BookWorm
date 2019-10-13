<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
<!-- Add jquery global library -->
<style><%@include file="/WEB-INF/css/details.css"%></style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">

	$(document).ready(function(){
		// TODO *** on window load, 
		// use the url from clicking an image from SearchResults.jsp
		// to open the the specified details by making an ajax call.
		
		// TODO *** add event handler to the image pic with "Current URL".
		// and pass the url
		
		if(sessionStorage.getItem("detailsPageURL")) {
		
		var detailsPageURL = sessionStorage["detailsPageURL"];
		console.log('going to', detailsPageURL);
		sessionStorage.removeItem("detailsPageURL");
		
		$.ajax({
			type: 'GET',
			url: detailsPageURL,
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-Type": "application/json; charset=utf-8",
			},
			success: function(result) {
				console.log(result);
				// author, publisher, publish date, ISBN 13, summary, and the star rating. 
	
				try {
				document.getElementById('result').innerHTML +=
					"<hr>" + 
				"<div class=\"book" + "\"" + "id=\"book-" + "\"" + "class=\"book-" + "\"" + ">"
					+ "<img class=\"" + "book-img book-img-" + "\" " + "src=\"" +  result.volumeInfo.imageLinks.thumbnail + "\">"
					+ "<div class= \"book-content\" id=\"book-content-"  + "\"" + "class=\"book-"  + "\"" + ">"
					+ "<h3><i>" +  result.volumeInfo.title + "</h3></i>" + "<br>"
					+ "<h4><i> " + result.volumeInfo.authors + "</h4></i>" + "<br>" 
					+ "<h4><i> Publisher: " + result.volumeInfo.publisher + "</h4></i>" + "<br>" 
					+ "<h4><i> Published Date: " + result.volumeInfo.publishedDate + "</h4></i>" + "<br>" 
					+ "<h4><i> ISBN: " + result.volumeInfo.industryIdentifiers[1].identifier + "</h4></i>" + "<br>" 
					
					
					+ "<b> Summary: </b> " + result.volumeInfo.description + "<br><br><br>" +
				"</div> </div>" + "<br><br><br>";
			
					+ "<h4><i> Rating: " + result.volumeInfo.authors + "</h4></i>" + "<br>"
				}
				catch (err) {
					sessionStorage.setItem("error", "The search did not fetch any valid results! Please try again");
					window.location="HomePage.jsp";
				}
			},
			error: function(error) {
				sessionStorage.setItem("error", "The search did not fetch any valid results! Please try again");
				window.location="HomePage.jsp";
			}
		})
		
	//	$('#body-content').html(function(index,html){
	//		console.log('hello');
	//	    return html.replace(undefined,'modified');
	//	});
		
		}
		
		$('#searchButton').click(function(){
			const apiKey = 'AIzaSyA1kVp-7zFSlHYfkXNYM5cuTsR_aZ0M0O8';
			console.log('searching for.. ', $('#searchKeywords').val());
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
		
		$('#result').click(function(){
			var lastSearchURL = sessionStorage.getItem('lastSearchURL');
			sessionStorage.setItem("url", lastSearchURL);
			window.location="SearchResults.jsp";
		});
});
</script>

</head> 
<body>

<div class="header"> 
	<a href="HomePage.jsp"><img class="img-bookworm" alt="bookworm" src="bookworm.png" alt="alt text" />
	</a>
<form id="searchForm"  method="post" action="SearchResults.jsp" >
	<div class="search-field">
		<input placeholder="What book is on your mind?" type="text" id="searchKeywords">
	</div>
	<div class="search-button">
	 	<input type="button" id="searchButton" value="Search!">
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
	</div>  
 
</form>  
</div> 
<div id="body-content">
<div id="result">
</div>
<hr>
</div>
</body>
</html>