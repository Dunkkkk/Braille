import SwiftUI

struct WelcomeView: View {
    
    @State private var isVisiable: Bool = true
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .onTapGesture {
                    isPresented = true
                }
            VStack {
                Text("About Braille")
                    .font(.system(size: 46, weight: .heavy, design: .rounded))
                Text("< Tap anywhere to start >")
                    .foregroundColor(.gray)
                    .opacity(isVisiable ? 1 : 0)
                    .animation(.easeIn(duration: 1).repeatForever())
            }
            .onAppear {
                isVisiable.toggle()
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            GuessWordView(viewmodel: GuessWordViewModel())
        }
    }
}
