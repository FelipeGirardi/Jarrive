//
//  StampExerciseScreen.swift
//  Jarrive
//
//  Created by Ronald on 18/11/23.
//

import SwiftUI

struct StampExerciseScreen: View {
    
    @State var shouldShowExplicatifView: Bool = false
    @State var shouldShowExerciceStack: Bool = false
    @State var shouldReviseExercice: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image("headerExercice")
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                    
                    HeaderContent(shouldShowExplicatifView: $shouldShowExplicatifView)
                }
                .frame(maxWidth: geometry.size.width, maxHeight: 240)
                
                // if shouldShowExerciceStack {
                //     ExerciceStack()
                // }
                
                if shouldShowExplicatifView {
                    ExplicatifView()
                } else {
                    ExercicesView(shouldReviseExercice: $shouldReviseExercice)
                }
            }
        }
        .background(Color("darkBlue"))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Selos")
                    }
                }
            }
        }
    }
}

struct StampExerciseViewPreview: PreviewProvider {
    static var previews: some View {
        StampExerciseScreen()
    }
}

struct HeaderContent: View {
    @Binding var shouldShowExplicatifView: Bool
    
    var body: some View {
        
        HStack(spacing: 20) {
            Image("stampVerbEtre1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            
            VStack(spacing: 20) {
                Button {
                    if !shouldShowExplicatifView {
                        shouldShowExplicatifView.toggle()
                    }
                } label: {
                    Text("Point Explicatif")
                        .font(.custom("Barlow-Bold", size: 16))
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 165, height: 42)
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .foregroundColor( shouldShowExplicatifView ? Color("mainDarkBlue") : Color("darkPurple") ))
                .shadow(color: .black, radius: 1, x: 0, y: 1.5)
                
                
                Button {
                    if shouldShowExplicatifView {
                        shouldShowExplicatifView.toggle()
                    }
                } label: {
                    Text("Exercices")
                        .font(.custom("Barlow-Bold", size: 16))
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 165, height: 42)
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .foregroundColor( shouldShowExplicatifView ? Color("darkPurple") : Color("mainDarkBlue") ))
                .shadow(color: .black, radius: 1, x: 0, y: 1.5)
                
            }
        }
    }
}

struct ExplicatifView: View {
    var body: some View {
        ScrollView {
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
                            .font(.custom("Barlow-SemiBoldItalic", size: 18))
                    }
                    
                    HStack(spacing: 6) {
                        Text("é o verbo")
                            .font(.custom("Barlow-Regular", size: 18))
                        
                        Text("SER e ESTAR")
                            .font(.custom("Barlow-SemiBoldItalic", size: 18))
                        
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
                    .font(.custom("Barlow-SemiBoldItalic", size: 20))
                    
                    Spacer()
                }
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Par exemple:")
                            .font(.custom("Barlow-Regular", size: 18))
                            .padding(.top)
                            .padding(.bottom, 8)
                        
                        HStack {
                            Text("Je suis")
                                .font(.custom("Barlow-SemiBoldItalic", size: 18))
                            
                            Text("un chat.")
                                .font(.custom("Barlow-Regular", size: 18))
                        }
                        
                        HStack {
                            Text("Tu es")
                                .font(.custom("Barlow-SemiBoldItalic", size: 18))
                            
                            Text("un human.")
                                .font(.custom("Barlow-Regular", size: 18))
                        }
                        
                        HStack {
                            Text("Nous sommes")
                                .font(.custom("Barlow-SemiBoldItalic", size: 18))
                            
                            Text("amis.")
                                .font(.custom("Barlow-Regular", size: 18))
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.leading)
        }
    }
    
}

struct ExercicesView: View {
    @Binding var shouldReviseExercice: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("EXERCICE")
                        .padding(.top)
                        .padding(.bottom)
                    
                    Text("Complete as frases")
                    Text("com a conjugação correta:")
                }
                .font(.custom("Barlow-Bold", size: 20))
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.leading)
            
            
            Spacer()
            
            
            Button {
                
            } label: {
                Text(shouldReviseExercice ? "CONTINUAR" : "CORRIGIR")
                    .font(.custom("Barlow-SemiBold", size: 20))
                    .foregroundColor(shouldReviseExercice ? Color("darkBlue") : .white )
            }
            .disabled(shouldReviseExercice)
            .frame(width: 330, height:50)
            .clipShape(Capsule())
            .background(
                Capsule()
                    .foregroundColor(shouldReviseExercice ? Color("mainGreen") :  Color("darkPurple") ) )
            .shadow(color: .black, radius: 1, x: 0, y: 1.5)
        
            
        }
    }
}

struct ExerciceStack: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    Button {
                        //
                    } label: {
                        Text("Exercice \(index+1)")
                            .font(.custom("Barlow-SemiBold", size: 14))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 100, height: 30)
                    .clipShape(Capsule())
                    .background(
                        Capsule()
                            .foregroundColor( Color("mainDarkBlue") ))
                    .shadow(color: .black, radius: 1, x: 0, y: 1.5)
                }
            }.padding()
        }
    }
}
