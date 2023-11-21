//
//  StampExerciseView.swift
//  Jarrive
//
//  Created by Ronald on 18/11/23.
//

import SwiftUI

struct StampExerciseView: View {
    
    @State var shouldShowExplicatifView: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image("OnboardingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack {
                        HeaderContent(shouldShowExplicatifView: $shouldShowExplicatifView)
                    }
                    .offset(y: 30)
                }
                .frame(maxWidth: .infinity, maxHeight: 270)
                .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
                .shadow(color: .black, radius: 1, x: 0, y: 1)
                
                // logic showing views
                
                VStack {
                    if shouldShowExplicatifView {
                        ExplicatifView()
                    } else {
                        Text("hello")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.all)
                    }
                }
            }
        }
        .background(Color("mainDarkBlue"))
        
    }
}

struct StampExerciseViewPreview: PreviewProvider {
    static var previews: some View {
        StampExerciseView()
    }
}

struct HeaderContent: View {
    @Binding var shouldShowExplicatifView: Bool
    
    var body: some View {
        
        HStack(spacing: 50) {
            Image("stampVerbEtre2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            
            VStack(spacing: 5) {
                Button {
                    if !shouldShowExplicatifView {
                        shouldShowExplicatifView.toggle()
                        print("show point explicatif")
                    }
                } label: {
                    Text("Point Explicatif")
                        .font(.custom("Barlow-Bold", size: 12))
                        .padding()
                        .foregroundColor( shouldShowExplicatifView ? Color("mainDarkBlue") : .white )
                }
                .frame(width: 115, height: 30)
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .foregroundColor( shouldShowExplicatifView ? .white : Color("mainDarkBlue") )
                        .shadow(color: .black, radius: 2, x: 0, y: 2) )
                
                
                Button {
                    if shouldShowExplicatifView {
                        shouldShowExplicatifView.toggle()
                        print("show point explicatif")
                    }
                } label: {
                    Text("Exercices")
                        .font(.custom("Barlow-Bold", size: 12))
                        .padding()
                        .foregroundColor( shouldShowExplicatifView ? .white : Color("mainDarkBlue"))
                }
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .frame(width: 115, height: 30)
                        .foregroundColor( shouldShowExplicatifView ? Color("mainDarkBlue") : .white)
                        .shadow(color: .black, radius: 1, x: 0, y: 2) )
            }
        }
    }
}

struct ExplicatifView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("POINT EXPLICATIF")
                    .font(.custom("Barlow-Bold", size: 20))
                    .padding(.top)
                    .padding(.bottom)
                
                HStack {
                    Text("O verbo")
                        .font(.custom("Barlow-Regular", size: 18))
                    
                    Text("ÊTRE:")
                        .font(.custom("Barlow-Bold", size: 18))
                }
                
                HStack(spacing: 6) {
                    Text("é o verbo")
                        .font(.custom("Barlow-Regular", size: 18))
                    
                    Text("SER e ESTAR")
                        .font(.custom("Barlow-Bold", size: 18))
                    
                    Text("em português.")
                        .font(.custom("Barlow-Regular", size: 18))
                }
                
                Text("A sua conjugação é: ")
                    .font(.custom("Barlow-Regular", size: 18))
                    .padding(.top)
                    .padding(.bottom)
            }
            
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Je")
                    Text("Tu")
                    Text("Il")
                    Text("Elle")
                    Text("Nous")
                    Text("Vous")
                    Text("Ils")
                    Text("Elles")
                }
                .font(.custom("Barlow-Regular", size: 20))
                
                VStack(alignment: .leading) {
                    Text("suis")
                    Text("es")
                    Text("est")
                    Text("est")
                    Text("sommes")
                    Text("êtes")
                    Text("sont")
                    Text("sont")
                }
                .font(.custom("Barlow-Bold", size: 20))
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text("Par exemple:")
                        .font(.custom("Barlow-Regular", size: 18))
                        .padding(.top)
                        .padding(.bottom, 8)
                
                
                    HStack {
                        Text("Je suis")
                            .font(.custom("Barlow-Bold", size: 18))
                        
                        Text("un chat.")
                            .font(.custom("Barlow-Regular", size: 18))
                    }
                    
                    HStack {
                        Text("Tu es")
                            .font(.custom("Barlow-Bold", size: 18))
                        
                        Text("un human.")
                            .font(.custom("Barlow-Regular", size: 18))
                    }
                    
                    HStack {
                        Text("Nous sommes")                            .font(.custom("Barlow-Bold", size: 18))
                        
                        Text("amis.")
                            .font(.custom("Barlow-Regular", size: 18))
                    }
            }
        }
        .foregroundColor(.white)
        .padding()
    }
    
    
}
