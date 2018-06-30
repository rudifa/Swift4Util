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
```
var string = "🇩🇪€4€9"
XCTAssertTrue(string.doesMatch(regex: "[0-9]"))
XCTAssertTrue(string.doesMatch(regex: "€"))
```
```
let contains_UUID = "https://stick-scan/product_images%2F08D41FB1-8B2E-4F6F-977A-BFA876AEF775.png"
let extracted_UUID = contains_UUID.extractUUID()
XCTAssertEqual(extracted_UUID, "08D41FB1-8B2E-4F6F-977A-BFA876AEF775")
```

### DictUtil

Declares a 2-tuple-like ```struct HashablePair<P1, P2>```
```
struct HashablePair<P1, P2>: Hashable where P1: Hashable, P2: Hashable {
    var firstProperty: P1
    var secondProperty: P2
    init(_ firstProperty: P1, _ secondProperty: P2) {
        self.firstProperty = firstProperty
        self.secondProperty = secondProperty
    }
}
```

which can be used to create a dictionary with that struct as a key. This is a partial workaround for the swift 4 tuple not being useable as a dictionary key.

Example:
```
enum State { case black, red, green, blue }

enum Event { case done, cancel, reset }

typealias State_Event = HashablePair<State, Event>

let dictionary: Dictionary<State_Event, State> = [
    State_Event(.black, .cancel): .red,
    State_Event(.black, .done): .black,
    State_Event(.red, .cancel): .black,
}
```
