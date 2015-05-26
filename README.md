# swift-handy
Handy Swift Helper belong here, Including my unfinish/use at risk helper.

### JSON
* https://github.com/SwiftyJSON/SwiftyJSON
```swift
// Note to self : Convert from string
let string = "{\n  \"foo\" : \"bar\"\n}"
let json = JSON(data:string.dataUsingEncoding(NSUTF8StringEncoding)!)
```

### Core
* https://github.com/pNre/ExSwift

### Date
* https://github.com/akosma/SwiftMoment

### Time
* https://github.com/radex/SwiftyTimer

### HTTP
* https://github.com/Alamofire/Alamofire

### NSUserDefaults
* https://github.com/radex/SwiftyUserDefaults
```swift
// Note to self : Complex use
Defaults["bar"] = NSKeyedArchiver.archivedDataWithRootObject([100:"foo", 2:"b", 3:["foo":"bar"]])
let bar: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(Defaults["bar"].data!)
println(bar)
```

### Colors
* https://github.com/katopz/google-material-color-swift
