//
//  AnyRouter.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter {
    
    var view: EntryPoint { get set }
    static func start() -> AnyRouter
    
}
