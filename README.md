# AVPhotoApp

This simple iOS application in Objective-C displays photo images provided by API data from a server.

The app consists of two views: Homepage View and Gallery View. 

**Homepage View**  
- Displays thumbnails of all the images downloaded from the API endpoint.
- A user can scroll through thumbnails of all the images.
- Images are displayed in the order indicated by the server.
- Each image is downloaded asynchronously and in a thread-safe manner.
- Clicking on a thumbnail opens a Gallery View.   

**Thought process**  
The easiest solution for this task and an app this size would be to call a method in the Homepage ViewController that pulls and parses API data from the endpoint, and displays pulled images in the cells. 



