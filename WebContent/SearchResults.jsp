<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
<!-- Add jquery global library -->
<style><%@include file="/WEB-INF/css/search.css"%></style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">

	$(document).ready(function(){
		var ids = [];
		var baseURL = 'https://www.googleapis.com/books/v1/volumes/';
		
		if(sessionStorage.getItem("url")) {
		
		var searchKeywords = sessionStorage["searchKeywords"];
		var searchURL = sessionStorage["url"];
		sessionStorage.setItem("lastSearchURL", searchURL);
		sessionStorage.removeItem("url");
		sessionStorage.removeItem("searchKeywords");
		if(!searchKeywords)
			searchKeywords = '';
		
		$.ajax({ 
			type: 'GET',
			url: searchURL, 
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-Type": "application/json; charset=utf-8",
			},
			success: function(result) {  
				// *** TODO: render result using innerHTML ***.
				console.log(result);
				// the book cover image, title, author, and the summary
				// of the book.
				for (i = 0; i < 10; i++) {  
 				console.log("The number is " + i );
 				try {
 				ids.push(result.items[i].id);
 				var listId = 'book-' + i;  
 				document.getElementById('heading').innerHTML = "Results for \" " + searchKeywords + " \" <hr>";
				
 				document.getElementById(listId).innerHTML +=
				"<div class=\"book" + "\"" + "id=\"book-" + i + "\"" + "class=\"book-" + i + "\"" + ">"
					+ "<img class=\"" + "book-img book-img-" + i + "\" " + "src=\""  + result.items[i].volumeInfo.imageLinks.thumbnail + "\">"
					+ "<div class= \"book-content\" id=\"book-content-" + i + "\"" + "class=\"book-" + i + "\"" + ">"
					+ "<h3><i>" +  result.items[i].volumeInfo.title + "</h3></i>" + "<br>"
					+ "<h4><i>" + result.items[i].volumeInfo.authors + "</h4></i>" + "<br>" 
					+ "<b> Summary: </b> " + result.items[i].volumeInfo.description + "<br><br><br>" + "<hr>"
				"</div> </div>" + "<br><br><br>";
				}
				catch (err) {
					sessionStorage.setItem("error", "The search did not fetch any valid results! Please try again");
					window.location="HomePage.jsp";
				}
			  }
			},
			error: function(error) {
				sessionStorage.setItem("error", "The search did not fetch any valid results! Please try again");
				window.location="HomePage.jsp";
			}
		}) 
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
		
		
		// TODO *** , REPLACE THIS HANDLER TO LISTEN TO IMAGE CLICK THAN ON DIV BOOK-I CLICK.
		for(let i=0; i<10; i++){
			let book = '#book-' + i;
		$(book).click(function(){
			// store url for details
			console.log('going to details page now..');
			var detailsPageURL = baseURL + 	ids[i];
			sessionStorage.setItem("detailsPageURL", detailsPageURL);
			window.location="Details.jsp";
		});
			 
		} 
		 
}); 
</script>   
<div class="header"> 
	<a href="HomePage.jsp"><img class="img-bookworm" alt="bookworm" src="bookworm.png" alt="alt text" /></a>
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
</head>
<body>
<hr>
  
	<div id="heading"></div>
	<span id="result">
		<div id="book-0"></div>
		<div id="book-1"></div>
		<div id="book-2"></div>
		<div id="book-3"></div>
		<div id="book-4"></div>
		<div id="book-5"></div>
		<div id="book-6"></div>
		<div id="book-7"></div>
		<div id="book-8"></div>
		<div id="book-9"></div>
	</span>
</body> 
</html> 