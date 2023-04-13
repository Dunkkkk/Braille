import SwiftUI

struct WelcomeView: View {
    
    @State private var isVisiable: Bool = true
    @State private var isPresented: Bool = false
    @State private var temp: Braille = Braille(meaning: [], dotNumber: [2,3])
    
    var body: some View {
        BackGroundView {
            VStack {
                Spacer()
                Image("Logo")
                Spacer()
                BrailleKeyPad(tapedKeys: $temp, isInteractive: true, isFirst: true)
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
            .padding(.bottom, 94)
        }
        .fullScreenCover(isPresented: $isPresented) {
            MenuView()
        }
//        ZStack(alignment: .top) {
//            LinearGradient(gradient: Gradient(colors: [Color(hex: "#FAF2D7")!, Color(hex: "#F0F0F0")!]),
//                           startPoint: .top, endPoint: .bottom)
//            Image("BrailleBackGround")
//                .opacity(0.05)
//            VStack {
//                Spacer()
//                Image("Logo")
//                Spacer()
//                BrailleKeyPad(tapedKeys: $temp, isInteractive: true, isFirst: true)
//                    .onTapGesture {
//                        isPresented.toggle()
//                    }
//            }
//            .padding(.bottom, 94)
//        }
//        .background(Color(hex: "#FEFAEA").edgesIgnoringSafeArea(.top))
//        .background(Color(hex: "#F0F0F0").edgesIgnoringSafeArea(.bottom))
//        .fullScreenCover(isPresented: $isPresented) {
//            MenuView()
//        }
//
        //
        //        ZStack {
        //            Rectangle()
        //                .foregroundColor(.white)
        //                .onTapGesture {
        //                    isPresented = true
        //                }
        //            VStack {
        //                HStack{
        //                    BrailleKeyPad(tapedKeys: $temp)
        //                        .frame(height: 150)
        //                    VStack{
        //                        Text("ic")
        //                            .font(.system(size: 46, weight: .heavy, design: .rounded))
        //                        Text("ac")
        //                            .font(.system(size: 46, weight: .heavy, design: .rounded))
        //                        Text("oe")
        //                            .font(.system(size: 46, weight: .heavy, design: .rounded))
        //                    }
        //                }
        //                Text("< Tap anywhere to start >")
        //                    .foregroundColor(.gray)
        //                    .opacity(isVisiable ? 1 : 0)
        //                    .animation(.easeIn(duration: 1).repeatForever())
        //            }
        //            .onAppear {
        //                isVisiable.toggle()
        //            }
        //        }
        //        .fullScreenCover(isPresented: $isPresented) {
        //            MenuView()
        //        }
    }
}

