# Safari

A website that tracks wildlife in the USA.

## To-Do

### Index
- Add some copy below the logo to explain the purpose of the site. "Mr. Mori needs your help!"
- Organize the page better into divs (possibly do this in layout file).

### View All Animals/Search Animals
- Add a page that allows the user to search for animals. (By default, the page will display all animals.)
- Research ways to display a table with filtering and sorting. (DataTables?)
- Research ways to display search fields above the table.

### Animal Details
- Add a template page that pulls the details of the animal and formats it nicely, like an encyclopedia entry.
-- The workflow would be the user clicks the animal name on the search page, and it takes them to the details page.
-- Optionally, add a button that exports the details to a PDF.
-- Add a button at the top that takes the user back to the search page.
-- Carousel of images at the top.

### Interactive Map
- Add an interactive map of the United States.

### Submit Animals
- Add more error handling.
- Add server-side error handling.

### Razor Partial Views
- Learn more about Razor partial views.

### SQL Database
- Test stored procedures.
- How do I store the description of the animal in the database so that it can be formatted nicely on the details page? CAN I even do that?
- Do I need more foreign key relationships?

### Future: Add More Images
- Add a page that allows the user to upload more images of an animal.
- Need to figure out how to give credit for royalty free images.

### Future: Moderation queue
- Add "AnimalQueue" and "AnimalPicQueue" tables to the database
- Add a page that allows the admin to moderate the animals and images that have been submitted.
-- If approved, the animal is added to the Animals table and the image is added to the AnimalPics table.
- Add a special folder for images being moderated?
-- Not ideal, people could submit inappropriate images and they'd have to be stored on the server...maybe make a hidden/secured folder so users can't mess around and access the images before they're approved.

### Future: Population Map
- Add a map that fills in colors according to the population of the selected animal.



