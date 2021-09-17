# Pawzzz
A simple flutter app for ACM Nebula Coding Challenge

## Installation
To download Flutter on VSCode, please check out this website and make sure to have the stable version of Flutter (2.5.0, at this moment): https://flutter.dev/docs/development/tools/vs-code

## Open project on VSCode

## Navigate across webpage
### Carousel
---
When the user first opens the page, they are greeted with a carousel of pictures of dogs. Although it is unclickable for information, it can be navigated by the user through their trackpad, if they specifically want to check out a dog. After 2-3 seconds, the carousel goes back to its automatic sliding of pictures.

### Search Bar
---
When the user clicks the search button, the search bar will find names of the dogs that resemble the user's input. When they click on the specific name, the data pulls up regarding the dog's information. When they go back to the search bar, they will see that it is on the list of recent dogs they visited. 

### All Dogs
---
Below the filtering section of dogs, the user is introduced to all the dogs that are stored within the database (JSON file, in this instance). They can then click on a dog and see the information regarding its bio: name, age, breed, category, and description.

### Filtering of Dogs
---
After scrolling down from the carousel, the user is shown categories of both breeds and ages. When the user selects the breed(s) and/or age(s), the dogs below the filtration will change based on the requirements given. When the user selects the dog, it will then navigate over to the page where the information about dog is shown.

### Favoriting a Dog and viewing the favorited Dogs
---

#### Favoriting a Dog
---
In the area where all dogs are shown, each card has a heart at the top right. When the user clicks on the heart, the heart becomes completely filled and the dog is added to the database (list, in this instance). On the other hand, when the user clicks on the heart again, the heart loses its fill and the dog is removed from the database (list, in this instance).

#### Viewing the favorited dogs
---
To view the dogs, there is a side navigation bar located at top left, that allows the user to navigate through different pages. Select the "My Favorite Dogs" section and a list of dogs that you selected will be shown. When clicked, the Card will then display information that the user wants.

### Buying the dog
---
When the user opens the page with only information of the dog, they can buy it by pressing a blue button near the bottom left that states "Add to Shopping Cart," and should be notified with a pop-up that confirms their payment.
