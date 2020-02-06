# MobiWriter

A Objective-C wrapper around MobiWriter (https://github.com/cafaxo/MobiWriter)

## Installation

Using the Swift Package Manager.
Add 

```swift
.package(url: "https://github.com/shinjukunian/MobiWriter-Cocoa.git", .branch("master"))
```
to ```dependencies:[]``` in your target.

## Usage

Convert .html files (no / minimal CSS, see the original library for restrictions) or HTML text to the mobipocket format.

```swift
import MobiWriter
let page=MobiPage(htmLatURL: htmlURL)
let writer=MobiExporter()
writer.author="Shakespeare"
writer.add(page)
let success=writer.write(to: #myURL)
```

## Licence
MIT for the wrapper.
See MobiWriter (https://github.com/cafaxo/MobiWriter) for the original library.

## Acknowledgements

Many thanks to the original author.

