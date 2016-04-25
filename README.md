<<<<<<< HEAD
Photo App

The app should consists of two views:

Homepage View
* V ~~Displays thumbnails of all the images downloaded from the API endpoint.~~
* V ~~A user can scroll through thumbnails of all the images.~~
* V ~~Images should be displayed in the order indicated by the server.~~
* V ~~Each image should be downloaded asynchronously and in a thread-safe manner.~~
* V ~~Clicking on a thumbnail should open a Gallery View.~~

Gallery View (Consists of 2 sections)   
Image View
* V ~~Should display a single image to fit the area.~~  **_- aspect fill is ok?_** 
* V ~~Will initially display the image that was clicked on in the previous step.~~
* V ~~Every two seconds the view should progress to the next image in the list.~~
* V ~~After the last image is displayed, starting over with the first image in the list.~~
 
  
Navigation Bar
* V ~~Back arrow button to return back to the Homepage.~~
* V ~~Displays image’s position in the list (i.e., “5/16”).~~
* Includes a button that removes an image from the list.  


**Additional Requirements**
* Testing 
* a README with any steps needed to start, and test your app. If there are any other required tools to run the project please specify or include a bundle.
* The app should cache data for offline use.
* The app should be attractive if initially started in offline mode. 
=======
# AVPhotoApp

This simple iOS application in Objective-C displays photo images provided by the API data from a server.

The app consists of two views: Homepage View and Gallery View. 

#### Run the app

Follow these steps to build and run the app via source code:
- Download the source code via `git clone` 
- Run `pod install` in the repo root to download all the dependencies
- Open `AVPhotoApp.xcworkspace`
- Build and Run
- Let me know what you think!

**Thought process/Architecture design**  

**Homepage View**    

We want to display thumbnails of all the images downloaded from the API endpoint in the Homepage View. The simplest solution for an app this size would be to call a method that pulls and parses API data directly in the Homepage ViewController, then provide the imageURL in the cellForItemAtIndexPath method to construct and display pulled images in the UITableView or UICollectionView cells. 

However, in a larger app and as a matter of good coding practices, a data model should be separated from a view, and only communicate to it through a controller (if we are to follow MVC design pattern). 

I represented the data model in this app as AVPhoto class that represents each photo object and has properties for imageURL, imageName, and imageDescription, AVAPIManager class that is responsible for pulling and parsing API data using [AFNetworking](https://github.com/AFNetworking/AFNetworking) library, and AVPhotoStore class that is a singleton and is responsible for creating an array of AVPhoto objects and passing that array to the ViewControllers that use that data. 

I wanted to use a UICollectionView to display the images because UICollectionViews are slightly more complex than UITableViews. 

A user can scroll through thumbnails of all the images, and images are displayed in the order indicated by the server.

To download each image asynchronously and in a thread-safe manner, I used [SDWebImage](https://github.com/rs/SDWebImage) library that provides us with an asynchronous image downloader.

When a user clicks on a thumbnail, a Gallery View opens and displays the image that fits the entire screen. 

**Gallery View**  

Gallery View initially displays the image that was clicked on in the Homepage view. Every two seconds the view progresses to the next image in the list using NSTimer class for implementation. After the last image is displayed, it starts over with the first image in the list. 

Navigation Bar has a back arrow button to return back to the Homepage, and displays image’s position in the list (i.e., “5/16”).
>>>>>>> c637bd8eb06bf08356cb63ea85b73def411e5b84
