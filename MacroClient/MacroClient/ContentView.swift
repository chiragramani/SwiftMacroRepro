import SwiftUI
import MacroExamplesLib

struct ContentView: View {
    
    init() {
        print(#stringify(1 + 2))
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

 
