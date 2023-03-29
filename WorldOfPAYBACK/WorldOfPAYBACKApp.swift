//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        AppCoordinator().onChange(of: scenePhase) { value in
            switch value {
            case .active:
                // config environment
            default: break
            }
        }
    }
}
