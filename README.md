# BetterBinding

BetterBinding aims to improve SwiftUI's `Binding` by introducing several operators that will save you time when writing SwiftUI views.

## Installation

BetterBinding can be installed via Swift Package Manager:

```
https://github.com/benlmyers/better-binding
```

## Usage

BetterBinding has 4 binding-related operators you can use to make using `Binding` in your projects much quicker.

### Quick Constant

Define a constant using the `%` operator:

```swift
%false // .constant(false)
%variable // .constant(variable)
%(-2.0) // .constant(-2.0)
```

### Conditional Unwrap

Unwrap `Binding<Optional<T>>` values conditionally:

```swift
$myBindingOptionalValue ?? %true
```

### Force Unwrap

Unwrap `Binding<Optional<T>>` values forcefully:

```swift
!$myBindingOptionalValue
```

### Binding and Non-Binding Equality

Check the equality of a `Binding<T>`'s unwrapped value with a `T` value, and get a `Binding<Bool>` source of truth:

```swift
Toggle("Option 0", isOn: $optionValue == 0)
Toggle("Option 1", isOn: $optionValue == 1)
Toggle("Option 2", isOn: $optionValue == 2)
```
