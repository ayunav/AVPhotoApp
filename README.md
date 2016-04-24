# AVPhotoApp

This simple iOS application in Objective-C displays photo images provided by the API data from a server.

The app consists of two views: Homepage View and Gallery View. 

**Thought process/Architecture design**  

**Homepage View**    

We want to display thumbnails of all the images downloaded from the API endpoint in the Homepage View. The simplest solution for an app this size would be to call a method that pulls and parses API data directly in the Homepage ViewController, then provide the imageURL received from the API to the cellForItemAtIndexPath method to display pulled images in the UITableView or UICollectionView. 

However, in a larger app and as a matter of good coding practices, a data model should be separated from a view, and only communicate to it through a controller (if we are to follow MVC design pattern). 

I represented the data model in this app as AVPhoto class that represents each photo object and has properties for imageURL, imageName, and imageDescription, AVAPIManager class that is responsible for pulling and parsing API data using AFNetworking library, and AVPhotoStore class that is a singleton and is responsible for creating an array of AVPhoto objects and passing that array to the ViewControllers that use that data. 

I wanted to use a UICollectionView to display the images because UICollectionViews are slightly more complex than UITableViews, and I wanted to demonstrate that I'm familiar with them. 

A user can scroll through thumbnails of all the images, and images are displayed in the order indicated by the server.

To download each image asynchronously and in a thread-safe manner, I used [SDWebImage](https://github.com/rs/SDWebImage) library that provides us with an asynchronous image downloader.

When a user clicks on a thumbnail, a Gallery View opens and displays the image that fits the entire screen. 

**Gallery View**  

Gallery View initially displays the image that was clicked on in the previous step.
Every two seconds the view should progress to the next image in the list.
After the last image is displayed, starting over with the first image in the list.






