//
//  BaseEntityBuilder.swift
//  RAMTests
//
//  Created by Mario Corte on 2/15/25.
//

import Foundation

protocol BaseEntityBuilder {
    associatedtype T : Encodable
    func build() -> T
    func buildData() -> Data
}

extension BaseEntityBuilder {
    func buildData() -> Data {
        try! JSONEncoder().encode(build())
    }
}
