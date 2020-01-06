# SwiftyCSV
Create CSV strings with none of the hassle! 📝

## Usage

### Creating a CSV Object

To create a CSV string, first create a `CSV` object.

```swift
// Create a blank CSV
let blankCSV = CSV()

// Create a CSV with one row
let csvWithData = CSV(firstRow: "Mario", "Luigi", "Link, "Zelda")
```

### Editing the CSV
To manipulate data, use the `appendRow(values: String...)` and `deleteRow(at rowIndex: Int)` functions.

```swift
// Create a blank CSV
let csv = CSV()

// Append a row to the CSV
csv.appendRow(values: "Bowser", "Ganondorf", "Team Rocket")

// Delete the row we just created
csv.deleteRow(at: 0)
```

### Exporting the CSV
To export the object as a CSV string, use the `csvString` property:

```swift
let csv = CSV(firstRow: "Koopa Beach", "Frappe Snowland", "Rainbow Road")

// Koopa Beach,Frappe Snowland,Rainbow Road
let csvString = csv.csvString
```

## CSV Edge Cases

### Commas
Values that contain a comma will be surrounded by quotes. For example,

```swift
let commaCSV = CSV(firstRow: "hello, world")
print(commaCSV.csvString)   // "hello, world"
```

### Double Quotes
Double quote characters are escaped by placing a second double quote character before the original double quote character.

```swift
let doubleQuoteCSV = CSV(firstRow: "\"hello world\"")
print(doubleQuoteCSV.csvString)   // ""hello world"" 
