//
//  StampExerciseView.swift
//  Jarrive
//
//  Created by Ronald on 18/11/23.
//

import SwiftUI

struct StampExerciseView: View {
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Image("OnboardingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack(spacing: 50) {
                        Image("stamp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 120)
                        
                        
                        VStack(alignment: .leading) {
                            Button {
                                print("show point")
                            } label: {
                                Text("Point Explicatif")
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(Color("mainDarkBlue"))
                            }
                            .clipShape(Capsule())
                            .background(.white)
                            
                            
                            Button {
                                print("show exercicies")
                            } label: {
                                Text("Exercicies")
                                    .frame(minWidth: 0, maxWidth: 120)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                                
                            }
                            .overlay(RoundedRectangle(cornerRadius: 25.0)
                                .stroke(style: StrokeStyle()))
                            .background(Color("mainDarkBlue"))
                        }
                        
                    }
                    
                }
                .frame(height: 270)
                .mask(CustomShape(radius: 25))
                .edgesIgnoringSafeArea(.top)

            }
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("POINT EXPLICATIF")
                        .font(.custom("Barlow-Bold", size: 20))
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("O verbo")
                            Text("ÊTRE:")
                                .font(.custom("Barlow-Bold", size: 20))
                                .foregroundStyle(.white)
                        }
                        
                        HStack {
                            Text("é o verbo")
                            
                            Text("SER e ESTAR")
                                .font(.custom("Barlow-Bold", size: 20))
                                .foregroundStyle(.white)
                            
                            Text("em português.")
                        }
                        
                        Text("A sua conjugação é: ")
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
                            .font(.custom("BasicSans-Regular", size: 19))
                            
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
                            .font(.custom("Barlow-Bold", size: 19))
                            
                            Spacer()
                        }
                    
                    Text("Par exemple:")
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Je suis")                            .font(.custom("Barlow-Bold", size: 19))
                            
                            Text("un chat.")
                        }
                        
                        HStack {
                            Text("Tu es")                            .font(.custom("Barlow-Bold", size: 19))
                            
                            Text("un human.")
                        }
                        
                        HStack {
                            Text("Nous sommes")                            .font(.custom("Barlow-Bold", size: 19))
                            
                            Text("amis.")
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
        .padding()
        .background(Color("mainDarkBlue"))
    }
}


struct CustomShape: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        let bls = CGPoint(x: rect.minX + radius, y: rect.maxY)
        let blc = CGPoint(x: rect.minX + radius, y: rect.maxY - radius)
        
        path.move(to: tl)
        path.addLine(to: tr)
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
                            startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bls)
        path.addRelativeArc(center: blc, radius: radius,
                            startAngle: Angle.degrees(90), delta: Angle.degrees(90))
        
        return path
    }
}

struct StampExerciseViewPreview: PreviewProvider {
    static var previews: some View {
        StampExerciseView()
    }
}
