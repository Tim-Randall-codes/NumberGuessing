//
//  Variables.swift
//  NumberGuessing
//
//  Created by Tim Randall on 28/7/21.
//

import Foundation
enum Page {
    case page1
    case page2
}
class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .page1
}

class Counter: ObservableObject {
    @Published var count: Int = 0
}
