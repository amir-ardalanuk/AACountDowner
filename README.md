# AACountDowner
Cool CountDowner ! 
### Requirements

   - iOS 10.0+ 
   - Xcode 8.1+
   - Swift 3.0+

## Install

you can use in cocoapods
```swift
pod 'AACountDowner'
```

![](https://github.com/amir-ardalanuk/AACountDowner/blob/master/CountDowner.gif)
![](https://github.com/amir-ardalanuk/AACountDowner/blob/master/IMG_1291.jpg)

## init
first : 
```swift
@IBOutlet weak var vwCountDowner: AACountDowner!
```
next : 
```swift
vwCountDowner.config(days: 1, hour: 1, minute: 1, second: 5)
```
or you can User ``Date`` but sure date is bigger than now
```swift
let date = Date()
vwCountDowner.config(withDate: date)
```
## Style

#### Visibility :
```swift
vwCountDowner.Visiblity(forDay: true, hour: true, minute: true, seconds: true)
```

#### Ui option : 
```swift
vwCountDowner.uiOption(haveShadow: true, background: UIColor.lightGray, radius: 5)
```
##### header title inVisible / visible
```swift
vwCountDowner.isTitleVisible = false 
```
_please! if you need more options , tell to me_
##### font :
```swift
vwCountDowner.font = UIFont(name: "Verdana", size: 16)
```


## License

AACountDowner is available under the MIT license. See the LICENSE file for more information.
