# SwiftyCSV
<p>
    <img src="https://img.shields.io/badge/Swift-5.1-ff69b4.svg" />
    <a href="https://twitter.com/fire_at_will_">
        <img src="https://img.shields.io/badge/Contact-@fire_at_will_-lightgrey.svg?style=flat" alt="Twitter: @twostraws" />
    </a>
</p>

Create CSV strings with none of the hassle! 📝

### Quickstart 🚀
Get started right away:
```swift
import SwiftyCSV

func createCSV() -> String {
  let csv = CSV(firstRow: "Hello", "World")
  return csv.csvString  // Hello,World
}
```

## Usage 📚

### Creating a CSV Object 

To create a CSV string, first create a `CSV` object.

```swift
// Create a blank CSV
let blankCSV = CSV()

// Create a CSV with one row
let csvWithData = CSV(firstRow: "Mario", "Luigi", "Link, "Zelda")
```

### Editing the CSV 📝
To manipulate data, use the `appendRow(values: String...)` and `deleteRow(at rowIndex: Int)` functions.

```swift
// Create a blank CSV
let csv = CSV()

// Append a row to the CSV
csv.appendRow(values: "Bowser", "Ganondorf", "Team Rocket")

// Delete the row we just created
csv.deleteRow(at: 0)
```

### Reading The CSV Object 📖
The `CSV` objects provides several read-only fields that supply information about the CSV. These fields include:
- `rows`: A 2D array containing the information in the CSV. The first array provides the rows while each subarray contains the columns in their respective row.
- numberOfRows: An integer representing the number of rows in the CSV.
- `numberOfColumns`: An integer representing the *maximum* number of columns of any of the rows in the CSV.

### Exporting the CSV ✈️
To export the object as a CSV string, use the `csvString` property:

```swift
let csv = CSV(firstRow: "Koopa Beach", "Frappe Snowland", "Rainbow Road")

// Koopa Beach,Frappe Snowland,Rainbow Road
let csvString = csv.csvString
```

## CSV Edge Cases 🤓
CSVs do have a few edge cases that you might want to be aware of.

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

## Credits

SwiftyCSV was made by [Will Taylor](https://twitter.com/fire_at_will_). It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.

## License

MIT License.

Copyright (c) 2020 Will Taylor

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
