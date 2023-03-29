//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import SwiftUI

struct BaseView<T: View>: View {
    var someView: T
    
    init(@ViewBuilder view: () -> T) {
        self.someView = view()
    }
    
    var body: T {
        return someView
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ViewController<T: View>: UIHostingController<T> {
//    let contentView = T()
    
    init(view: BaseView<T> = BaseView(view: <#T##() -> _#>)) {
        super.init(rootView: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func test() {
    let view = ViewController(view: ContentView())
}
