//
//  Observable.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import Combine

class Observable<T> {
    private var _value: T
    var value: T {
        get { _value }
        set {
            _value = newValue
            valueSubject.send(newValue)
        }
    }

    private let valueSubject = PassthroughSubject<T, Never>()

    var publisher: AnyPublisher<T, Never> {
        valueSubject.eraseToAnyPublisher()
    }

    init(_ value: T) {
        self._value = value
    }
}
