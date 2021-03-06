`XCUIElement` extension contains additional methods for handling swipes, tapping on elements or clearing text fields.

The `isVisible` property indicates if the element exists and is hittable.
There are cases where checking only `hittable` property is not working as expected.

The `text` property can be used to retrieve value from text field as `String`.

`swipe(from:to:)` is an alternative to `swipeUp`, `swipeDown`, `swipeLeft` and `swipeBottom` methods provided by `XCTest`.
It lets you specify coordinates on the screen (relative to the view on which the method is called).

**Example:**

```swift
let scroll = app.scrollViews.element
scroll.swipe(from: CGVector(dx: 0, dy: 0), to: CGVector(dx: 1, dy: 1))
```

`swipe(to:avoid:from:)` variation scrolls the screen until given element becomes visible.
Note that `XCTest` automatically does the scrolling during `tap()`, but the method is still useful in some situations,
for example to reveal element from behind keyboard.

**Example:**

```swift
let scroll = app.scrollViews.element
let button = scroll.buttons.element
scroll.swipe(to: button)
```

`swipe(to:times:avoid:from:until:)`, and two specialized method `swipe(to:untilExist:times:avoid:from:)` and `swipe(to:untilVisible:times:avoid:from:)`,
swipes scroll view to given direction until condition will be satisfied or in case of specialised methods element would exist or will be visible.
It is a useful method to scroll collection view to reveal an element. In collection view, only a few cells are available in the hierarchy.
To scroll to given element you have to provide swipe direction.
It is not possible to detect when the end of the scroll was reached, that is why the maximum number of swipes is required (by default 10).
The method will stop when the maximum number of swipes is reached or when the condition will be satisfied.

**Example:**

```swift
let collectionView = app.collectionViews.element
let element = collectionView.staticTexts["More"]
collectionView.swipe(to: .down, untilVisible: element)
```

`clearTextField()` and `clear(andType:)` provides straightforward method to delete text from text field and then type the provided string.

`tap(withOffset:app:orientation:)` performs `tap()` on given coordinates (relative to the receiving element).
Can be used to test view where position of the tap matters. It's also possible to tap a subview (like table view cell), without actually queuing that subview.

`smartCoordinate(withNormalizedOffset:app:orientation:)` is an replacement of the `coordinate(withNormalizedOffset:)` from `XCUIElement`.
`XCUICoordinate` has an open [issue](https://openradar.appspot.com/31529903). Coordinates works correctly only in portrait orientation.
This method and `SmartXCUICoordinate` was implemented as a workaround based on [glebon](https://gist.github.com/glebon) [gist](https://gist.github.com/glebon/9b2bc64bfce0dd4299c522df16866822).

```swift
let element = app.tableViews.element
element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
```
