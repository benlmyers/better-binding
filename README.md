# BetterBinding

BetterBinding aims to improve SwiftUI's `Binding` by introducing several operators that will save you time when writing SwiftUI views.

## Installation

BetterBinding can be installed via Swift Package Manager:

```
https://github.com/benlmyers/better-binding
```

## Usage

BetterBinding has 5 binding-related operators you can use to make using `Binding` in your projects much quicker.

### Quick Constant

Define a constant using the `%` operator:

```swift
%false // .constant(false)
%variable // .constant(variable)
%(-2.0) // .constant(-2.0)
```

### Quick Unwrap

Unwrap a binding using the `%` operator:

```swift
%myBindingVar // myBindingVar.wrappedValue
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
Toggle("Option 2", isOn: $optionValue != 2)
```

### Binding and Non-Binding Comparison

Compare a `Binding<T>` with a `T` value, and get a `Binding<Bool>` source of truth:

```swift
Toggle("Option 0", isOn: $optionValue < 2)
Toggle("Option 1", isOn: $optionValue >= 5)
```

### Logical Operators

Use binary locical operators to unify two `Binding<Bool>`s:

```swift
Toggle("A or B", isOn: $valueA || $valueB) // Toggling this will set both to the new value.
Toggle("A and B", isOn: $valueA && $valueB) // Toggling this will set both to the new value.
```

Negate a `Binding<Bool>`:

```swift
Toggle("Not A", isOn: !$valueA)
```
