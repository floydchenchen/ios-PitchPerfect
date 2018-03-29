# Pitch Perfect Project (Intro to iOS Development)

## Introduction
This app records a conversation with you and a friend and plays it back to make you sound like a chipmunk or Darth Vader! Currently Six different Voice-Effects are supported.

## Screen shots
![](https://raw.githubusercontent.com/floydchenchen/pictures/master/Screen%20Shot%202018-03-29%20at%202.57.47%20AM.png)
![](https://raw.githubusercontent.com/floydchenchen/pictures/master/Screen%20Shot%202018-03-29%20at%203.00.01%20AM.png)



## Lesson 1: Course Map
* intro to xcode
* Auto Layout and Buttons
* ViewController and Multiple Views
* Delegation and Recording

### Xcode
* left: navigator panel
* middle: content
* right: utility area with inspector panel
* bottom: debug and console window

![](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Art/BBUI_workspacewindow_callouts_2x.png)

### Model View Controller Pattern
![](https://koenig-media.raywenderlich.com/uploads/2016/06/MVC-feature-250x250.png)

## Lesson 2: AutoLayout and Buttons
### UIKit
* UILabel
* UIButton
* UIView
* UIViewController

### StoryBoard
* A storyboard is a visual representation of the user interface of an iOS application, showing screens of content and the connections between those screens.
* A Scene Corresponds to a Single View Controller and Its Views
* A Segue Manages the Transition Between Two Scenes
![](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/Art/storyboard.jpg)

### App Delegate Source File
* The AppDelegate.swift source file has two primary functions:
    * It defines your AppDelegate class. The app delegate creates the window where your app’s content is drawn and provides a place to respond to state transitions within the app.
    * It creates the entry point to your app and a run loop that delivers input events to your app. This work is done by the UIApplicationMain attribute (@UIApplicationMain), which appears toward the top of the file.


### The View Controller Source File
* This file defines a custom subclass of UIViewController named ViewController. Right now, this class simply inherits all the behavior defined by UIViewController. To override or extend that behavior, you override the methods defined on UIViewController.
* override func viewDidLoad()
* override func viewWillAppear(_ animated: Bool)

### Constraints among different UIElements 

### Code to connect with UIElements
* IBAction: reaches from UI elements to code
* IBOutlet: reaches from code to UI elements

## Lesson 3: ViewController and Multiple Views
### Application Lifecycle
![](https://raw.githubusercontent.com/floydchenchen/pictures/master/Screen%20Shot%202018-03-29%20at%202.36.03%20AM.png)

### View Controller Lifecycle
![](https://raw.githubusercontent.com/floydchenchen/pictures/master/Screen%20Shot%202018-03-29%20at%202.39.05%20AM.png)

* viewDidLoad vs viewWillAppear
    * viewDidLoad: things you have to do once.
    * viewWillAppear: gets called every time the view appears. 


### UIButton
* enable and disable

```swift
stopRecordingButton.isEnabled = true
recordButton.isEnabled = false
```

### Multiple Views Management
![](https://raw.githubusercontent.com/floydchenchen/pictures/master/Screen%20Shot%202018-03-29%20at%202.44.40%20AM.png)

## Lesson 4: Delegation and Recording


