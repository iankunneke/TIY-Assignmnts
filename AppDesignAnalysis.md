# App Design Analysis

Bagel Runner
  -Choose what you want to do (modal)
  -Tap play now, game center, store, or settings (Navigation Push)
    -Play now screen is a basic view controller with a tap to begin funcion
    -Game Center is table view controller with a rating feature, facebook like button, 2 tabs of leaderboards and challenges with player names and score
    -The store is a basic view controller with a back button
    -The settings screen is a basic view controller with 5 buttons, sound volume and mute button, remove ads button, report bugs or give feedback button and a back button.

Instagram
  -Tabbed application
      -First tab is home which is a feed of pictures with name link to profile in scroll view
      -Second is the search tab which is a search bar and search display controller
      -Third camera view is modal
      -Fourth is activity tab with a custom table view and two tabs to chose from
      -Fifth is the personal profile tab which is also in the custom collection view with four more tabs of its own, the first in the collection view, second in custom table view, third in map kit view, and fourth in collection view.
      -Fifth has a UIBarButton which brings you to sections that in a table view with sections.

Snapchat
  -Opens up to camera view.
    -Has an affordance which has 3 buttons and 2 UIBarButtons
      -First button goes into a Navigation Controller in the table view.
      -Second goes into a table view with 2 buttons that go into either a search bar and search display and the other goes into a search and table view that scrolls.
      -Third goes into search display controller with a navigation item and a tab to view contacts
      -One UIBarButton is a view controller help screen, the other is a table view navigation controller.
      -Swipe left into a table view that has two buttons at the top one for a back to camera view and the other goes to a search bar modal in the table view
      -Swipe right to go into a table view with two buttons at the top, one for going back to the camera and the other navigates to a custom collection view with a back button.
Solitare
  -Tabbed application
    -Settings Tab is a table view controller with segmented controls, switches and navigation items.
    -Game Center Tab as a table view controller with buttons for leaderboards, achievements, multiplayer, invite friends and a done button to go back to the main screen.
    -Winning Tab is a table view controller with 3 tabs arranging the data in the table in different ways, and theres two buttons, one with a video tutorial on solitare and the other to go back to the main screen.
    -The Play Tab brings up an Action Sheet which allows you to start a new game with different options and a cancel which brings the sheet back down
    -The Help Tab brings up an alert view if you are not in a game with 2 options and if you are in a game it highlights a move you can do in the game.

Angry Birds
  -Custom View Controller
    -Toons TV button which takes you to a page view controller with options to pick from and has 2 option buttons for the type of videos and a back button
    -Thers a settings button which when pressed bring up 3 buttons for disabling power ups in the game, viewing the credits and turning off the sound
    -The store button brings you to collection view with options of in app purchases and a back button to return to the main screen.
    -the register button pops up an alert view where you can click to register or close the box
    -The last button is the play button which brings you to a page view controller where you can select the level or press the back button to the home screen.

MyFitnessPal
  -Tabbed application
    -Home Tab is a custom table view controller
    -Diary Tab is a Table View Controller with buttons to add food or view options
    -The add tab in the middle brings up the option the quick add things to your diary for the diary
    -The progress tab is a custom view controller with a button at the top that brings up a picker view, and there are also 2 other buttons that bring up a picker view
    -More Tab is a Table View Controller which all cells are navigation bars to various options

Pandora
  -Tabbed application
    -Stations tab is a Table View Controller with a button to add stations and a button to the AVKit Player View Controller.
    -Feed Tab is a Text View that scrolls with a button to the AVKit Player View Controller
    -Profile tab is in a custom scroll view with buttons to edit your profile, or comment and a button to go to the AVKit Player
    -Settings tab is a table view controller with mostly navigation bar cells, there is also a switch button, help button and a button to go  to the AVKit Player.

eBay
  -Tabbed Application
    -Home tab is a collection view controller
    -Search tab is a Search Bar and Search Display Controller that also has  navigation controller cells
    -My eBay tab is a view controller with three tabs that are all in collection view
    -Sell tab is a Search Bar and Display Controller
    -Cart tab is a View Controller with two tabs both in a basic view controller view

Fairwinds
    -Tabbed Application
      -Home Tab has two text field cells for username and passwork and a switch button and a login button
      -Locations Tab as a table view controller with navigation controllers cells and a search bar at the top
        -Also a button that displays a MapKit View with a search bar
      -More Tab is a table view controller with navigation controller cells

The Weather Channel
  -Custom View Controller
    -Collection view that scrolls with a MapKit View in it and also has sections that are Page Controlled.
    -Button at the top right to get to a search bar and search display screen with you can also swipe to get to this screen from the main screen
    -Button on the top left of the main screen that brings you to a table view controller with navigation controller cells and there is also a switch button.
