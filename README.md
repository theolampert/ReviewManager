# ReviewManager

Simple mechanism to ask for an app store review after a number of actions.

```swift
ReviewManager.requestReviewIfAppropriate()

ReviewManager.requestReviewIfAppropriate(minimumReviewWorthyActionCount: 5) // defaults to 4
```
