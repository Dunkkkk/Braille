import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}
