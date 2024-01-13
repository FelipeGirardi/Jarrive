//
//  BienvenueView.swift
//  Jarrive
//
//  Created by Ronald on 12/01/24.
//

import SwiftUI

struct BienvenueView: View {    
    
    @State private var onboardingData = OnboardingData()
    @State private var showTranslation = false
    @State private var shouldGoToPosLoginChat = false
    
    @State private var isPostLoginChatDone = UserDefaults.standard.bool(forKey: "isPostLoginChatDone")
    
    var body: some View {
        if shouldGoToPosLoginChat {
            OnboardingMainScreen()
        } else {
            ZStack {
                Image("jarrive train")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Image("JarriveLogo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 245, height: 92)
                    .padding(.bottom, 500)
                
                VStack {
                    VStack(spacing: 0){
                        Text("Bem-vindo!")
                            .frame(width: 200, height: 65)
                            .font(.custom("Barlow-Medium", size: 32))
                            .foregroundColor(Color("mainDarkBlue"))
                            .background {
                                Capsule()
                                    .fill(Color("mainGreen"))
                            }
                        
                        Triangle()
                            .foregroundColor(Color("mainGreen"))
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(180))
                    }
                    .opacity(showTranslation ? 1 : 0)
                    
                    Text("Bienvenue!")
                        .frame(width: 355, height: 85)
                        .font(.custom("Barlow-semiBold", size: 58))
                        .foregroundColor(Color("mainBlue"))
                        .underline()
                        .background(Color("defaultOffWhite"))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 40,
                                bottomTrailingRadius: 40,
                                topTrailingRadius: 40
                            )
                        )
                        .background(Capsule()).shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .onTapGesture {
                            if showTranslation {
                                showTranslation = false
                            } else {
                                showTranslation = true
                            }
                        }
                }
                .padding(.bottom, 150)
            }.onTapGesture {
                shouldGoToPosLoginChat = true
            }
        }
    }
}
    
struct BienvenuePreview:PreviewProvider {
    static var previews: some View {
        BienvenueView()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}
