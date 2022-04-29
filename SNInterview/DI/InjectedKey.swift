//
//  InjectedKey.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

public protocol InjectionKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

extension InjectedValues {
    var service: Service {
        get { Self[NetworkProviderKey.self] }
        set { Self[NetworkProviderKey.self] = newValue }
    }
}

private struct NetworkProviderKey: InjectionKey {
    static var currentValue: Service = NetworkService()
}

struct InjectedValues {
    private static var current = InjectedValues()
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
