#  Swift4Util

Start of a collection of swift 4 utilities, with unit tests.

### DateUtil
Extends class ```Date``` with properties:  
```
.ddMMyyyy
.HHmmss
```

Usage example:

```
print("Today", date.ddMMyyyy, "at", date.HHmmss, "...")

Today 18.06.2018 at 15:02:57 ...
```

### RegexUtil

Extends class ```String``` with methods:  
```
.matches(for regex: String) -> [String]
.isBlank() -> Bool
.doesMatch(regex: String) -> Bool
.extractUUID() -> String
```

Usage examples:
```
var string = "🇩🇪€4€9"
var matched = string.matches(for: "[0-9]")
XCTAssertEqual(matched, ["4", "9"])
XCTAssertFalse(string.isBlank())
```
```
var string = "🇩🇪€4€9"
var matched = string.matches(for: "[0-9]")
//print(matched)
XCTAssertEqual(matched, ["4", "9"])
print("---", string, matched, "blank: \(string.isBlank())")
XCTAssertFalse(string.isBlank())
```
```
string = " \t  \n"
XCTAssertTrue(string.isBlank())
```
``
var string = "🇩🇪€4€9"
XCTAssertTrue(string.doesMatch(regex: "[0-9]"))
XCTAssertTrue(string.doesMatch(regex: "€"))
```
```
let contains_UUID = "https://stick-scan/product_images%2F08D41FB1-8B2E-4F6F-977A-BFA876AEF775.png"
let extracted_UUID = contains_UUID.extractUUID()
XCTAssertEqual(extracted_UUID, "08D41FB1-8B2E-4F6F-977A-BFA876AEF775")
```
