# FrameKit

A Swift macOS app libary that helps you build stunning App Store screenshots with SwiftUI. This library contains a collection of class/protocol that are required in making workflows to deal with mobile app's store screenshots.

* [Why FrameKit?](https://github.com/ainame/FrameKit#why-framekit)
* [Get started](https://github.com/ainame/FrameKit#get-started)
* [References](https://github.com/ainame/FrameKit#references)

## Why FrameKit?

### What is Store Screenshots?

In your product page on App Store and Google Play store must have screenshots that showcase the best part of your apps to visually communicate with your app's experience. I call them "store" screenshots whilst I call a plain screenshots directly taken on a device or simulator as "app" screenshots.

See how store screenshots on product page looks like from here.
* https://developer.apple.com/app-store/product-page/
* https://play.google.com/console/about/storelistings/

### Why not ask designer to make them?

Let's say you are working on an app that supports 20 languages in the app and App store/Google Play. Your app has 6 screenshots to showcase great features. If it's support iPad and Android tablet, your designer would need to make screenshots for all of them to cover.

In total, it could be 20 langs \* (4 screen size for App Store + 2 size for Google Play) \* 6 screenshots = 720 screenshots! It's likely that your designer will give up it in the middle. Not only the designer needs to deal with large number of screenshots but also *someone* needs to take **app** screenshots somewhow.

So why not automate the process?

### Why not fastlane frameit?

Okay I know the pain but why don't you use [existing solution](https://docs.fastlane.tools/getting-started/ios/screenshots/) in [fastlane/fastlane](https://github.com/fastlane/fastlane)? fastlane snapshot + frameit is the way to go automation, isn't it?

There's a couple of reasons not to use fastlane for screenshots. Basically fastlane frameit is limtied.

* Doesn't support Arabic proerply due to the underlying dependency (ImageMagick) https://github.com/fastlane/fastlane/issues/7522
* Only supports 1 app screenshot per 1 store screenshot (Hero screenshot design tends to have multiple app screenshots)
* Even font size can't be fixed and it's dynamic
* Hard to debug
* Designers wouldn't be happy with limtied design achieved by frameit

### What Framekit can help?

* Frame app screenshot into device frame images
* Write store screenshot design with SwiftUI
* Build commandline tools to generate store screenshots with any inputs
* Layout text by maintaining each line length's evenly and not to wrap in the middle of a word even in languages like Japanese and Chineses that have no space between words
* Custom font support

## Get started

### Pre-requirement

Although FrameKit doens't depend on fastlane itself, it's much easier for anyone to get device frame images via [fastlane/frameit-frames](https://github.com/fastlane/frameit-frames).

Try either

* Install `fastlane` via `gem install fastlane` or Bundler and then run `fastlane frameit download_frames`
   * It'll create `~/.fastlane/frameit/latest` directory
* Directly git clone [fastlane/frameit-frames](https://github.com/fastlane/frameit-frames) and use `latest` directory

### FrameKit

FrameKit itself is Swift Package Manager's package so you can install it via SPM. Add below to your `Package.swift`.

```swift
.package(url: "https://github.com/ainame/FrameKit", from: "0.1.0"),
```

At least you need to create following things by yourself.

* SwiftUI's `View` that conforms to `StoreScreenshotView` protocol and implements the store screenshot design
* `Layout` definition conforming `LayoutProvider` protocol, which mean to hold hardcoded any layout values for each screen size
* A `struct` to store screenshot contents; such as title or framed app screenshot images, which will be `StoreScreenshotView.Cotent`

You can find how it can be from sample code at [`Source/SampleFrameKitLayout`](https://github.com/ainame/FrameKit/tree/main/Sources/SampleFrameKitLayout).

**Note that FrameKit is a macOS app library so you need to touch AppKit more or less but don't worry most work is done within SwiftUI.**

Next write your workflow in any format possible. I would recommend to build a CLI tool using [`apple/swift-argument-parser`](https://github.com/apple/swift-argument-parser). See an example at [`Sources/SampleFrameKitCLI`](https://github.com/ainame/FrameKit/tree/main/Sources/SampleFrameKitCLI).

In the below sample code, FrameKit provides `DeviceFrame` and `StoreScreenshotRenderer` so that you don't have to deal with some magic in AppKit to get JPEG image rendered.

```swift
import AppKit
import SwiftUI
import FrameKit

// Define layout for your desired device (this could be defined somewhere as static property)
// This is what you need to define by yourself
let layoutForiPhone65inch = Layout(
    size: CGSize(width: 1242, height: 2688),
    deviceFrameOffset: .zero,
    textInsets: EdgeInsets(top: 72, leading: 120, bottom: 0, trailing: 120),
    imageInsets: EdgeInsets(top: 0, leading: 128, bottom: 72, trailing: 128),
    keywordFontSize: 148,
    titleFontSize: 72,
    textGap: 24,
    textColor: .white,
    backgroundColor: Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)
)

// DeviceFrame.makeImage is to embed "app" screenshot into given device frame
let framedScreenshot = try DeviceFrame.makeImage(
    screenshot: absolutePath(screenshot),
    deviceFrame: absolutePath(deviceFrame),
    deviceFrameOffset: layoutForiPhone65inch.deviceFrameOffset
)

// Arbitary struct to include contents to be rendered on store screenshtos
// This is what you need to define
let content = SampleContent(
    keyword: "Weather",
    title: "Come to the UK",
    framedScreenshots: [framedScreenshot]
)

// Ininitialize the designed view that you defined
let view = SampleStoreScreenshotView.makeView(layout: layoutForiPhone65inch, content: content)

// Render the image into outputPath with this
let render = StoreScreenshotRenderer(outputPath: "./output.jpg", layoutDirection: .leftToRight)
try render(view)
```

## References

### Specifications

See the official documents

* App Store https://help.apple.com/app-store-connect/#/devd274dd925
* Google Play https://support.google.com/googleplay/android-developer/answer/9866151?hl=en#zippy=%2Cscreenshots

### Acknowledgment

Although I decided not to go with fastlane frameit, I started this screeshot work with it and it inspired me a lot.
Thank you very much for people contributing frameit.

And also many works in this repo involved working time at [Cookpad](https://careers.cookpad.com/).
Thank you very much for allowing me to work on this.
