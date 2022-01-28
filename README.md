# thelist-pre

TheListTest project is compatible with iOS and iPadOS 13.0 and more,and macOS 10.5 and later, the project's widget can be run for devices with iOS (or iPadOS) 14.0 and more. this readme was conducted to explain all parts of code that are developed for the project.
I should say forgive me for the UI is not exactly the same as the real project, because I created it with my eyes and also I did not have any UI design (like images, XD file, etc) and I did not access the images that are used on the project ( I mean I saw your project on my iPhone and design the storyboard based upon that)
So most of the project’s data are the dummy ( category icons, banner images,  background, colors, and …)

## External Framework:
 for the banner portion on the home page, I have forked a framework and customized it for the project to seems similar to your project’s UI design, you can access to the branch of the framework which I have added (via SPM) to the project through the following link ( it's on my Github account):

https://github.com/Mohsenkhodadadzadeh/Glideshow/tree/myModify

Even though I acknowledge the banner portion has something different in appearance, I just use it to show how easy to develop a framework :).



## Architecture pattern and design patterns

the project is developed by VIPER Architecture pattern and a couple of design patterns are used for services purposes, an observer pattern fetching image from the internet and saving it for the widget, a chain of responsibility pattern to handle HTTP response.


## project’s sections

### public protocols

this directory comprises all protocols which use for VIPER patterns, `AnyRouter`, `AnyPresenter`, `AnyInteractor`, and `AnyView`



### Model

this directory includes all entities that use on the project `BaseModel`, `BannerModel`, and `WidgetModel` are in this directory.




## Routers
it has `BannerRouter` class and this class has three overloading types of `start` function

`static func start() -> AnyRouter ` : uses for prepare Router and other VIPER objects without any paramater ( for HomeVC)

`static func start(_ view: EntryPoint) -> AnyRouter `: Uses for preparing Router and other VIPER objects via a specific View ( view must be as a viewController and AnyView)

`static func start(_ view: AnyView) -> AnyRouter`: Uses for preparing Router and other VIPER objects via a specific View ( view must be just as an AnyView) this overload uses for the test case.




## Interactors and Presenters directories
all Interactor classes will be saved on the Interactors directory and also all Presenter classes will be saved on the Presenters directory.




## View Directory
this directory contains everything that is related to view. It can be included files that are related to the view part on VIPER or other files that are related to ViewController etc.

### MainTabBar on View->Bars Directory

in this class, I have added shadow for the Bottom-Bar and also I disabled the maximize button on the macOS app on the `viewDidApear` overriding func

```Swift
 override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOpacity = 0.4
        
           // disable full-screen button
           if  let NSApplication = NSClassFromString("NSApplication") as? NSObject.Type,
               let sharedApplication = NSApplication.value(forKeyPath: "sharedApplication") as? NSObject,
               let windows = sharedApplication.value(forKeyPath: "windows") as? [NSObject]
           {
               for window in windows {
                   let resizable = 3
                   property("styleMask", object: window, set: [], clear: [resizable])
                   let fullScreenPrimary = 7
                   let fullScreenAuxiliary = 8
                   let fullScreenNone = 9
                   property("collectionBehavior", object: window, set: [fullScreenNone], clear: [fullScreenPrimary, fullScreenAuxiliary])
               }
           }
    }
```

I also defined maximum and minimum size for MacOS app size to prevent users from resizing the app on the `viewWillLayoutSubviews` func

```Swift
override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(macCatalyst 14, *) {
                    view.window?.windowScene?.sizeRestrictions?.minimumSize = CGSize(width: 500, height: 850)
                    view.window?.windowScene?.sizeRestrictions?.maximumSize = CGSize(width: 500, height: 850)
                }
    }
```


### HomeView file on View->Home Directory

this is an extension of Home VC for implementing AnyView Protocol and this file is responsible for getting data (or error) from the `BannerPresenter` class
I also save the first cell of BannerModel to show it on the widget on ` func update<T>(with result: T) where T : Decodable, T : Encodable` func

```Swift
 func update<T>(with result: T) where T : Decodable, T : Encodable {
        if let obj = result as? BaseModel<[BannerModel]> {
            prepareBannerSlider(obj.data)
            if !obj.data.isEmpty {
                Storgage.shared.storeForWidget(obj.data[0])
            }
            print(obj.data)
        }
    }
```




## CustomView Directory
it has just one XiB file called `CustomHomeCategory` and I use it for four category objects that are laid on the home page.



## Services
This directory includes Image downloading activities ( just uses for saving data to use them on widget), HTTP response handler ( chain network), call and receive external API activity (on network class), custom network errors (on NetworkErrors), and a class for storing data to use them on the widget (Storage)

**You can check how they work with the `ServicesTests` class on the UnitTest target.**




## Extensions Directory
This directory has just on file (an extension of UIView), and I added a function to UIView to fill the view with its child.




## IBDesignable directory

I used this directory to save all custom designable views, at the moment, it has two files `CustomButton`, and `GradientBackgroundView`




## popularClientWidget->View directory

This directory uses to save 3 custom swiftUI views for the widget, `SmallView`, `MediumView`, and `LargeView`

