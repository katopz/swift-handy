# swift-handy
Handy Swift Helper belong here, Including my unfinish/use at risk helper.

### CocoaPods
* Create `Podfile`
```shell
platform :ios, '8.0'
use_frameworks!

pod 'Signals', '~> 1.0'
```
and then 
```shell
$ pod install
```

### Signals
* https://github.com/artman/Signals

### JSON
* https://github.com/SwiftyJSON/SwiftyJSON
```swift
// Note to self : Convert from string
let string = "{\n  \"foo\" : \"bar\"\n}"
let json = JSON(data:string.dataUsingEncoding(NSUTF8StringEncoding)!)
```

### Core
* https://github.com/pNre/ExSwift

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

### Date
* https://github.com/akosma/SwiftMoment

### Time
* https://github.com/radex/SwiftyTimer

### Helper
* KZBlock
```swift
primus.on("open", listener : KZBlock<@objc_block () -> ()> {
    let _ = primus.write(["event": "roomAdd", "room": "defaultRoom"])
}.casted)

primus.on("data", listener : KZBlock<@objc_block (NSDictionary, AnyObject) -> ()> { (d: NSDictionary, raw: AnyObject) in
    NSLog("Got data: \(d)")
}.casted)
```

* KZPacker
```swift
let string = "{\"foo\":\"bar\"}"
let key = "foos"
var old_data = [1:string, 2:string, 3:string]
var new_data = [2:string, 4:string]

// save
KZPacker.pack(key, old_data)

// load
var data = KZPacker.unpack(key) as! [Int:String]
println("get    : \(data)")

// sort
var sorted_data = sorted(data) { $0.0 > $1.0 }
println("sorted : \(sorted_data)")
    
// merge
for item in new_data {
	old_data[item.0] = item.1
}
println("merged : \(old_data)")

// remove
println("remove : " + key)
KZPacker.remove(key)

if let del_data = KZPacker.unpack(key) as? [Int:String] {
    println(" This should not be seen : \(del_data)")
}
```
