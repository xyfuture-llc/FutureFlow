# FutureFlow
FutureFlow is a SwiftUI-based iOS library that enables you to create engaging and informative tutorials within your app. With customizable "spotlight" tutorials, you can guide users through the key features of your app seamlessly. FutureFlow is easy to integrate and includes detailed documentation and sample code to help you get started.

## Compatibility
This is a light weight SwiftUI ONLY package. It works with `iOS 14.0+`, `macOS 11.0+`, `tvOS 14.0+`, `watchOS 7.0+`.

As of **April 22nd, 2023**, there are no plans to support UIKit nor support any SwiftUI backward compatibility (e.g. `iOS 
13.0`).

If you however, would like to tackle backward compatibility or UIKit support, feel free to fork this repo and work on it and 
hit me up to merge your contribution and credit you.

## Installation
### Swift Package Manager (SPM)
To add FutureFlow to your project, use Xcode’s built-in support for Swift packages. Click File → Swift Packages → Add Package Dependency, and paste the following URL into the search field:

```
https://github.com/xyfuture-llc/FutureFlow.git
```

You’re then prompted to select the version to install and indicate the desired update policy. I recommend starting with the latest version (it’s selected automatically), and choosing “up to next major” as the preferred update rule. Once you click Next, the package is fetched. Then select the target you’re going to use FutureFlow in. Click Finish, and you’re ready to go.

### CocoaPods
To be released


## Usage
A full example can be found inside the `Examples` directory.

In order to use FutureFlow you first need to create an `enum` that conforms to `FutureFlow` protocol (Conforming to `CaseIterable` is optional but it makes your life easy).

### Step 1
```Swift
enum TutorialChunks: FlowChunk, CaseIterable {
}
```

Inside the enum define the steps in which you want the spotlight to go to.

```Swift
enum TutorialChunks: FlowChunk, CaseIterable {
    case red
    case green
    case yellow
}
```

This is as simple as it gets; However you can customize it further by defining the spotlight shape, the type of background, or even include an instructions view (A view where you instruct the user why are you shining the spot light here).

Here are the defined protocols
```Swift
    var spotlightShape: SpotlightShape { get }
    var spotlightBackground: SpotlightBackground { get }

    @InstructionsViewBuilder func instructionsView(
        _ next: @escaping () -> (),
        _ back: @escaping () -> ()
    ) -> AnyInstructionsView?

    var instructionsViewPosition: InstructionsViewPosition? { get }
```

Here are the default values if the above is not defined:

- `spotlightShape`: `.rectangle`
- `spotlightBackground`: `.black`
- `instructionsView`: `nil`
- `instructionsViewPosition`: `center`

You can customize a shape or a background by calling the `.custom` enum case such as 

```Swift
enum TutorialChunks: FlowChunk, CaseIterable {
    case red
    case green
    case yellow
    
    var spotlightShape: SpotlightShape {
        return SpotlightShape.custom {
            Circle()
                .foregroundColor(.white)
                .blur(radius: 3)
        }
    }
}
```

### Step 2
After creating your enum you should create the view in which you want to shine spotlight on.

```Swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 256, height: 256, alignment: .center)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: 64, height: 128, alignment: .center)
                .foregroundColor(Color.green)
            
            Circle()
                .frame(width: 128, height: 128, alignment: .center)
                .foregroundColor(.yellow)
        }
        .padding()
    }
}
```

Now you need to create a unique identifier for this view in which we will be using as well as a namespace and a variable to control if the spotlight view should be displayed or not (in this case I am calling it a "tutorial")

```Swift
...
    private var uniqueIdentifier: String = UUID().uuidString
    
    @State private var showTutorial: Bool = true
    @Namespace var namespace
...
```

As can be seen there must be a parent container to wrap the elements to shine a `spotlight` on. In this case I am using `VStack`.

Now you need to call `configureChunkForSpotlight` on each element you want to shine the spotlight on and you need to call `assembleSpotlightChunks` on the wrapper.

#### `configureChunkForSpotlight`
Prepares the current view to be highlighted by the spotlight effect, associating it with the specified `FlowChunk`.

This function should be used to mark individual child views within a parent view that has the `assembleSpotlightChunks` function applied to it.

- Parameters:
    - namespace: The namespace that belongs to the view where the animations will be played.
    - parentIdentifier: A unique string identifier for the parent view containing the spotlight effect.
    - chunk: The `FlowChunk` associated with the current view, which determines the spotlight shape, background, and other properties.

- Returns: The modified view with the matched geometry effect applied, allowing it to be highlighted by the spotlight effect.

#### `assembleSpotlightChunks`
Sets up the parent view to contain the spotlight effect, using the provided `FlowChunk` instances.

This function should be used to wrap the parent view containing child views that have the `configureChunkForSpotlight` function applied to them.

The chunks provided must be of the same `FlowChunk` type as the one used by the child views, to ensure that the spotlight effect works as intended.

- Parameters:
    - namespace: The namespace that belongs to the view where the animations will be played.
    - uniqueIdentifier: A unique string identifier for the parent view. This identifier must be the same as the one provided to the `configureChunkForSpotlight` function for child views.
    - chunks: An array of `FlowChunk` instances associated with the child views to be highlighted by the spotlight effect.
    - showTutorial: A boolean variable to toggle the spotlight view on and off.
    - onStepChange: An optional callback method that will be triggered when the current step is changed, basically when the spotlight shines on a different element than the current element.

- Returns: The modified view with the `HighlightingView` applied, containing the spotlight effect and its child views.

---

This is how the final view looks like 

```Swift
struct ContentView: View {
    private var uniqueIdentifier: String = UUID().uuidString
    
    @State private var showTutorial: Bool = true
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 256, height: 256, alignment: .center)
                .foregroundColor(.red)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.red
                )
            
            Rectangle()
                .frame(width: 64, height: 128, alignment: .center)
                .foregroundColor(Color.green)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.green
                )
            
            Circle()
                .frame(width: 128, height: 128, alignment: .center)
                .foregroundColor(.yellow)
                .configureChunkForSpotlight(
                    namespace: self.namespace,
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: TutorialChunks.yellow
                )
                .onTapGesture {
                    self.showTutorial = true
                }
        }
        .padding()
        .assembleSpotlightChunks(namespace:self.namespace, uniqueIdentifier: self.uniqueIdentifier, chunks: Array(TutorialChunks.allCases), showTutorial: self.$showTutorial) {
            chunk in
            print("A new step")
        }
    }
}
```

That's it! This is the whole API. 

## More
You can browse teh source files to learn more about the other options available to you. You can also look at "Examples" directory as I will add more examples for different features/options.

## Contributing
Contributions are welcome!

Have a look at [issues](https://github.com/xyfuture-llc/FutureFlow/issues) to see the project’s current needs. Don’t hesitate to create new issues, especially if you intend to work on them yourself.

If you’d like to discuss something else, contact me directly.

## License and Copyright
FutureFlow is licensed under the MIT License. See the [LICENSE file](https://github.com/xyfuture-llc/FutureFlow/blob/main/LICENSE) for details.

© 2023–2023 xyFuture, LLC 
