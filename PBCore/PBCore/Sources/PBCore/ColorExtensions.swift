//
//  ViewExtensions.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 26/03/23.
//

import UIKit
import SwiftUI

public extension UIColor {
    public static var darkBluePB: UIColor = UIColor(displayP3Red: 46/256, green: 46/256, blue: 128/256, alpha: 1)
    public static var darkBluePBtransparent: UIColor = UIColor(displayP3Red: 46/256, green: 46/256, blue: 128/256, alpha: 0.1)
    public static var lightBluePB: UIColor = UIColor(displayP3Red: 200/256, green: 212/256, blue: 248/256, alpha: 1)
    public var color: Color { Color(self) }
}
