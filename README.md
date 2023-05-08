# Safari

A website that tracks wildlife in the USA.

## To-Do

### Index
- Add some copy below the logo to explain the purpose of the site. "Mr. Mori needs your help!"
- Organize the page better into divs (possibly do this in layout file).

### Search Animals
- Add a page that allows the user to search for animals. (By default, the page will display all animals.)
- Research ways to display a table with filtering and sorting.
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
- Add a page that allows the user to submit an animal sighting.
- Allow them to upload an image, but they have to include the "source" of the image, and it has to be royalty free (like Pixabay).
- Add logic to reformat the image file name to something easily organized/searchable.

### Future: Add More Images
- Add a page that allows the user to upload more images of an animal.
- Need to figure out how to give credit for royalty free images.

### Future: Moderation queue
- Add "AnimalQueue" and "AnimalPicQueue" tables to the database
- Add a page that allows the admin to moderate the animals and images that have been submitted.
-- If approved, the animal is added to the Animals table and the image is added to the AnimalPics table.
- Add a special folder for images being moderated?
-- Not ideal, people could submit inappropriate images and they'd have to be stored on the server...maybe make a hidden/secured folder so users can't mess around and access the images before they're approved.

### SQL Database
- Test stored procedures.
- Add error handling (i.e., make sure max weight is greater than or equal to min weight).
- Re-scaffold the database into the Safari.Data project.
- How do I store the description of the animal in the database so that it can be formatted nicely on the details page? CAN I even do that?

