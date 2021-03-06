//
//  BetterBinding.swift
//  flowductive-mu (iOS)
//
//  Created by Ben Myers on 6/22/21.
//

import SwiftUI

prefix operator %

@available(iOS 13, macOS 10.15, *)
public func == <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Equatable {
  Binding(
    get: {
      lhs.wrappedValue == rhs
    },
    set: {
      if $0 {
        lhs.wrappedValue = rhs
      }
    }
  )
}

@available(iOS 13, macOS 10.15, *)
public func != <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Equatable {
  Binding(
    get: {
      lhs.wrappedValue != rhs
    },
    set: {
      if !$0 {
        lhs.wrappedValue = rhs
      }
    }
  )
}

@available(iOS 13, macOS 10.15, *)
public func < <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Comparable {
  Binding(
    get: {
      lhs.wrappedValue < rhs
    },
    set: { _ in }
  )
}

@available(iOS 13, macOS 10.15, *)
public func <= <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Comparable {
  Binding(
    get: {
      lhs.wrappedValue <= rhs
    },
    set: { _ in }
  )
}

@available(iOS 13, macOS 10.15, *)
public func > <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Comparable {
  Binding(
    get: {
      lhs.wrappedValue > rhs
    },
    set: { _ in }
  )
}

@available(iOS 13, macOS 10.15, *)
public func >= <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Comparable {
  Binding(
    get: {
      lhs.wrappedValue >= rhs
    },
    set: { _ in }
  )
}

@available(iOS 13, macOS 10.15, *)
public prefix func ! (lhs: Binding<Bool>) -> Binding<Bool> {
  Binding(
    get: { !lhs.wrappedValue },
    set: { lhs.wrappedValue = !$0 }
  )
}

@available(iOS 13, macOS 10.15, *)
public func || (lhs: Binding<Bool>, rhs: Binding<Bool>) -> Binding<Bool> {
  Binding(
    get: {
      lhs.wrappedValue || rhs.wrappedValue
    },
    set: {
      lhs.wrappedValue = $0
      rhs.wrappedValue = $0
    }
  )
}

@available(iOS 13, macOS 10.15, *)
public func && (lhs: Binding<Bool>, rhs: Binding<Bool>) -> Binding<Bool> {
  Binding(
    get: {
      lhs.wrappedValue && rhs.wrappedValue
    },
    set: {
      lhs.wrappedValue = $0
      rhs.wrappedValue = $0
    }
  )
}

@available(iOS 13, macOS 10.15, *)
public func ?? <T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
  Binding(
    get: { lhs.wrappedValue ?? rhs },
    set: { lhs.wrappedValue = $0 }
  )
}

@available(iOS 13, *)
public prefix func ! <T>(lhs: Binding<Optional<T>>) -> Binding<T> {
  Binding(
    get: { lhs.wrappedValue! },
    set: { lhs.wrappedValue = $0 }
  )
}

@available(iOS 13, *)
public prefix func % <T>(lhs: T) -> Binding<T> {
  return .constant(lhs)
}
