# BookWorm, a book search app for avid readers!
This is a simple demo using the Google Books API implementing Search on Author / Publisher / Book Name / ISBN Code.

## Home Page
The user can search the catalog using the above search criteria. If no option is selected, the search is performed on all 4 categories by default. Clicking the bookworm image from any other page redirects to the home page 
<p align="center"><img src="screenshots/home.JPG" /></p>

## Search Results Page
The results page lists down the Image, Summary & Author(s) of the books.
The image of the books is clickable and redirects to the book details page.
<p align="center"><img src="screenshots/results.JPG" /></p>

## Book Details Page
This page provides additional nformation about a book such as the publisher, publish date & ISBN code.
Clicking the book image again redirects back to the results page.

<p align="center"><img src="screenshots/product.JPG" /></p>
The user can also perform a new search using the search bar which is re-placed at the top of the page.

## Error handling
Incase of invalid queries or no search results, the error message notifies the user of it.
<p align="center"><img src="screenshots/invalid-search.JPG" /></p>

### To run the project in Eclipse
You will require javax.servlet.jar, and Tomcat 9.0 or +

