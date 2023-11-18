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
            Group {
                ZStack {
                    Image("OnboardingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        Image("stamp")
                            .frame(width: 120, height: 100)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Button {
                                print("point")
                            } label: {
                                Text("Point Explicatif")
                                    .frame(minWidth: 0, maxWidth: 120)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            .overlay(RoundedRectangle(cornerRadius: 25.0)
                                .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/))
                            .background(Color("mainDarkBlue"))
                            
                            
                            Button {
                                print("exercicies")
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
                
            }
            .frame(height: 300)
            .mask(CustomShape(radius: 25))
            .edgesIgnoringSafeArea(.top)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("POINT EXPLICATIF")
                    .bold()
                    .foregroundColor(.white)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("O verbo")
                        Text("ÊTRE")
                            .bold()
                            .foregroundStyle(.white)
                    }
                    
                    HStack {
                        Text("é o verbo")
                        
                        Text("SER e ESTAR")
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("em português")
                    }
                    
                    
                    Text("A sua conjugação é: ")
                }
            }
        }
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
