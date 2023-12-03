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
                        .edgesIgnoringSafeArea(.top)
                        .padding(.bottom)
                    
                    HeaderContent(shouldShowExplicatifView: $shouldShowExplicatifView)
                }
                .frame(maxWidth: geometry.size.width, maxHeight: 140)

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
    
    // MARK: Properties
    @State var progress: CGFloat = 0.0
    @State var characters: [Character] = characters_Mock
    
    // MARK:
    // For Drag Part
    @State var shuffledRows: [[Character]] = []
    
    // For Drop Part
    @State var rows: [[Character]] = []
    
    // Animation
    @State var animateWrongText: Bool = false
    @State var droppedCount: CGFloat = 0
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    
                    Capsule()
                        .fill(Color("mainGreen"))
                        .frame(width: geometry.size.width * progress)
                }
            }.frame(height: 20)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Complete as frases:")
                        .font(.custom("Barlow-Bold", size: 20))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(.leading)
            
            
            DropArea()
                .padding(.vertical, 30)
            
            DragArea()
            
            Spacer()
            
            Button {
                // logic to change state
            } label: {
                Text("CORRIGIR")
                    .font(.custom("Barlow-SemiBold", size: 20))
                    .foregroundColor(shouldReviseExercice ? Color("darkBlue") : .white )
            }
            .disabled(true) // change logic
            .frame(width: 330, height: 50)
            .clipShape(Capsule())
            .background(
                Capsule()
                    .foregroundColor(shouldReviseExercice ? Color("mainGreen") :  Color("darkPurple") ) )
            .shadow(color: .black, radius: 1, x: 0, y: 1.5)
            .padding(.bottom)
        }
        .offset(x: animateWrongText ? -30 : 0)
        .onAppear {
            // MARK: Build Grid
            if rows.isEmpty {
                characters = characters.shuffled()
                shuffledRows = generateGrid()
                characters = characters_Mock
                rows = generateGrid()
            }
        }
    }
    
    // MARK: Drop Area
    @ViewBuilder
    func DropArea() -> some View {
        VStack(spacing: 12) {
            
            ForEach($rows, id: \.self) { $row in
                VStack(spacing: 10) {
                    ForEach($row) { $item in
                        HStack {
                            Text(item.sentence[0])
                            
                            Text(item.value)
                                .font(.system(size: item.fontSize))
                                .padding(.vertical, 5)
                                .padding(.horizontal, item.padding)
                                .opacity(item.isShowing ? 1 : 0)
                                .background {
                                    Capsule()
                                        .fill(item.isShowing ? .clear : .gray.opacity(0.25))
                                }
                                .background {
                                    // when item is dropped into correct place
                                    Capsule()
                                        .stroke(.gray)
                                        .opacity(item.isShowing ? 1 : 0)
                                }
                                .onDrop(of: [.url], isTargeted: .constant(false)) { providers in
                                    
                                    if let first = providers.first {
                                        let _ = first.loadObject(ofClass: URL.self) { value, error in
                                            guard let url = value else { return }
                                            
                                            print(url)
                                            
                                            if item.id == "\(url)" {
                                                withAnimation{
                                                    item.isShowing = true
                                                    updateShuffledArray(character: item)
                                                }
                                            } else {
                                                // animation of wrong answer
                                                animateView()
                                            }
                                            
                                        }
                                    }
                                    return false
                                }
                            
                            Text(item.sentence[1])
                        }
                    }
                }
                
                if rows.last != row {
                    Divider()
                }
            }
        }
    }
    
    // MARK: Drag Area
    @ViewBuilder
    func DragArea() -> some View {
        HStack(spacing: 12) {
            ForEach(shuffledRows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row) { item in
                        
                        Text(item.value)
                            .onDrag {   // return id to find which item is moving
                                return .init(contentsOf: URL(string: item.id))!
                            }
                            .background {
                                Capsule().stroke(.gray)
                            }
                            .font(.system(size: item.fontSize))
                            .padding(.vertical, 5)
                            .padding(.horizontal, item.padding)
                            .opacity(item.isShowing ? 0 : 1)
                            .background {
                                Capsule()
                                    .fill(item.isShowing ? Color(.gray).opacity(0.25) : Color(.clear))
                                    //.opacity(item.isShowing ? 0.25 : 0)
                            }
                    }
                }
                
                if shuffledRows.last != row {
                    Divider()
                }
            }
        }
    }
    
    // MARK: Generating Custom Grid Columns
    func generateGrid() -> [[Character]] {
        // Identify each text width and update it into state variable
        for item in characters.enumerated() {
            let textSize = textSize(character: item.element)
            characters[item.offset].textSize = textSize
        }
        
        var gridArray: [[Character]] = []
        var tempArray: [Character] = []
        
        var currentWidth: CGFloat = 0
        let totalScreenWidth: CGFloat = UIScreen.main.bounds.width - 30
        
        // swap
        for character in characters {
            currentWidth += character.textSize
            
            if currentWidth < totalScreenWidth {
                tempArray.append(character)
                
            } else {
                gridArray.append(tempArray)
                tempArray = []
                currentWidth = character.textSize
                tempArray.append(character)
            }
        }
        
        if !tempArray.isEmpty {
            gridArray.append(tempArray)
        }
        
        return gridArray
    }
    
    
    func textSize(character: Character) -> CGFloat {
        let font = UIFont.systemFont(ofSize: character.fontSize)
        let attributes = [NSAttributedString.Key.font : font]
        let size = (character.value as NSString).size(withAttributes: attributes)
        
        return size.width + (character.padding * 2) + 15
    }
    
    
    func updateShuffledArray(character: Character) {
        for index in shuffledRows.indices {
            for subIndex in shuffledRows[index].indices {
                if shuffledRows[index][subIndex].id == character.id {
                    shuffledRows[index][subIndex].isShowing = true
                }
            }
        }
    }
    
    func animateView() {
        withAnimation(
            .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.2)
            .delay(1)
        ) {
            animateWrongText = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(
                .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.2)
                .delay(1)
            ) {
                animateWrongText = false
            }
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
