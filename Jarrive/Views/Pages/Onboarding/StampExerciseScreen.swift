//
//  StampExerciseScreen.swift
//  Jarrive
//
//  Created by Ronald on 18/11/23.
//

import SwiftUI

struct StampExerciseScreen: View {
    
    // MARK: - Logic properties
    // meu deus do ceu pra que tanto bool
    @State var shouldShowExplicatifView: Bool = false /* false CHANGE TO CODE OTHER VIEWS */
    @State var shouldShowEcouteModal: Bool = false
    @State var shouldShowEcouteExerciceView: Bool = false /* true CHANGE TO CODE OTHER VIEWS */
    @State var shouldReviseDragDropExercice: Bool = false
    @State var shouldReviseEcouteExercice: Bool = false
    
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
                .frame(maxWidth: geometry.size.width, maxHeight: 190)
                
                if shouldShowExplicatifView {
                    ExplicatifView()
                } else {
                    if !shouldShowEcouteExerciceView {
                        ExercicesView(shouldReviseDragDropExercice: $shouldReviseDragDropExercice,
                                      shouldShowEcouteModal: $shouldShowEcouteModal)
                    } else {
                        EcoutePhrasesExerciceView(shouldReviseEcouteExercice: shouldReviseEcouteExercice)
                    }
                }
            }
            
            // MARK: - Ecoute Phrases Modal
            if shouldShowEcouteModal {
                EcoutePhasesModal(shouldShowEcouteModal: $shouldShowEcouteModal, shouldShowEcouteView: $shouldShowEcouteExerciceView)
            }
        }
        .background(shouldShowExplicatifView ? .white : Color("defaultDarkBlue"))
        .navigationBarBackButtonHidden()
        .toolbar {
            if !shouldShowEcouteModal {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Carte Postale")
                        }
                        .foregroundColor(Color("mainBlue"))
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

// MARK: - Header Content
struct HeaderContent: View {
    @Binding var shouldShowExplicatifView: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading) {
                        Text("Verbes")
                        Text("#001")
                    }
                    .font(.custom("Barlow-Bold", size: 16))
                    .foregroundStyle(Color("mainBlue"))
                    
                    VStack(alignment: .leading) {
                        Text("Être")
                            .font(.custom("Barlow-Bold", size: 24))
                            .foregroundStyle(Color("mainBlue"))
                        
                    }
                    
                    Button {
                        print("aaaa")
                    } label: {
                        Image("audioButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tint(Color("mainBlue"))
                    }
                    .frame(width: 35, height: 35)
                    .padding(.bottom)
                }.padding(.leading, 10)
                
                Spacer()
                
                VStack(spacing: 10) {
                    Button {
                        if !shouldShowExplicatifView {
                            shouldShowExplicatifView.toggle()
                        }
                    } label: {
                        Text("Point Explicatif")
                            .font(.custom("Barlow-Bold", size: 16))
                            .padding()
                            .foregroundColor(shouldShowExplicatifView ? .white : Color("defaultDarkGray"))
                    }
                    .frame(width: 165, height: 35)
                    .clipShape(Capsule())
                    .background(
                        Capsule()
                            .foregroundColor(shouldShowExplicatifView ? Color("mainBlue") : Color("defaultOffWhite"))
                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
                    
                    Button {
                        if shouldShowExplicatifView {
                            shouldShowExplicatifView.toggle()
                        }
                    } label: {
                        Text("Exercices")
                            .font(.custom("Barlow-Bold", size: 16))
                            .padding()
                            .foregroundColor(shouldShowExplicatifView ? Color("defaultDarkGray") : .white)
                    }
                    .frame(width: 165, height: 35)
                    .clipShape(Capsule())
                    .background(
                        Capsule()
                            .foregroundColor( shouldShowExplicatifView ? Color("defaultOffWhite") : Color("mainBlue") )
                            .shadow(color: .gray, radius: 2, x: 0, y: 2))
                }.padding(.bottom, 50)
            }
            .padding()
        }
    }
}

// MARK: - Explicative View
struct ExplicatifView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                HStack {
                    Button {
                        print("aaaa")
                    } label: {
                        Image("audioButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 35, height: 35)
                    
                    Text("Conjugaison")
                        .font(.custom("Barlow-SemiBold", size: 24))
                        .padding(.top)
                        .padding(.bottom)
                }.foregroundColor(Color("mainBlue"))
                
                VStack {
                    GeometryReader { geometry in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("O verbo")
                                    .font(.custom("Barlow-Regular", size: 18))
                                
                                Text("ÊTRE:") // Change to Barlow-BoldItalic
                                    .font(.custom("Barlow-SemiBoldItalic", size: 18))
                            }
                            
                            HStack(spacing: 6) {
                                Text("é o verbo")
                                    .font(.custom("Barlow-Regular", size: 18))
                                
                                Text("SER e ESTAR") // Change to Barlow-BoldItalic
                                    .font(.custom("Barlow-SemiBoldItalic", size: 18))
                                
                                Text("em português.")
                                    .font(.custom("Barlow-Regular", size: 18))
                            }
                            
                            Text("A sua conjugação é: ")
                                .font(.custom("Barlow-Regular", size: 18))
                                .padding(.bottom)
                            
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
                                } // TO-DO: Change to Barlow-BoldItalic
                                .font(.custom("Barlow-SemiBoldItalic", size: 20))
                                
                                Spacer()
                            }
                        }.padding()
                    }
                }
                .background(Color("defaultOffWhite"))
                .foregroundColor(Color("defaultGray"))
                .frame(width: 340, height: 320, alignment: .center)
                
                HStack {
                    Button {
                        print("aaaa")
                    } label: {
                        Image("audioButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 35, height: 35)
                    
                    Text("Exemples")
                        .font(.custom("Barlow-SemiBold", size: 24))
                        .padding(.top)
                        .padding(.bottom)
                }.foregroundColor(Color("mainBlue"))
                
                VStack(alignment: .leading) {
                    VStack {
                        GeometryReader { geometry in
                            HStack{
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    HStack(spacing: 4)  {
                                        Text("Je suis")
                                            .font(.custom("Barlow-SemiBoldItalic", size: 18))
                                        
                                        Text("un chat.")
                                            .font(.custom("Barlow-Regular", size: 18))
                                    }
                                    
                                    HStack(spacing: 4)  {
                                        Text("Tu es")
                                            .font(.custom("Barlow-SemiBoldItalic", size: 18))
                                        
                                        Text("un human.")
                                            .font(.custom("Barlow-Regular", size: 18))
                                    }
                                    
                                    HStack(spacing: 4)  {
                                        Text("Nous sommes")
                                            .font(.custom("Barlow-SemiBoldItalic", size: 18))
                                        
                                        Text("amis.")
                                            .font(.custom("Barlow-Regular", size: 18))
                                    }
                                }
                                .padding()
                                Spacer()
                            }
                        }
                    }
                    .background(Color("defaultOffWhite"))
                    .foregroundColor(Color("defaultGray"))
                    .frame(width: 340, height: 90, alignment: .center)
                }
            }
        }
    }
}

// MARK: - Exercice View
struct ExercicesView: View {
    
    // MARK: Properties of the View
    @Binding var shouldReviseDragDropExercice: Bool
    @State var progress: CGFloat = 0.0
    @State var characters: [Character] = characters_Mock
    
    // Flow Control
    @Binding var shouldShowEcouteModal: Bool
    
    // MARK: - Properties of Drag&Drop
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
            }.frame(height: 20).padding(.horizontal).padding(.top)
            
            // MARK: - Drag&Drop Exercice
            HStack {
                VStack(alignment: .leading) {
                    Text("Complete as frases:")
                        .font(.custom("Barlow-Bold", size: 20))
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
            }
            .padding(.leading)
            
            DropArea()
                .padding(.vertical, 30)
            
            DragArea()
            
            Spacer()
            
            Button {
                self.shouldShowEcouteModal = true
            } label: {
                Text("CONTINUAR")
                    .font(.custom("Barlow-Bold", size: 20))
                    .foregroundColor(shouldReviseDragDropExercice ? Color(.white) : Color("defaultDarkBlue") )
            }
            .disabled(!shouldReviseDragDropExercice)
            .frame(width: 330, height: 50)
            .clipShape(Capsule())
            .background(
                Capsule()
                    .foregroundColor(shouldReviseDragDropExercice ? Color("mainGreen") :  Color("darkGray") ) )
            .padding(.bottom)
        }
        .offset(x: animateWrongText ? -30 : 0)
        .onAppear {
            // MARK: - Build Grid
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
                VStack(alignment: .center, spacing: 10) {
                    ForEach($row) { $item in
                        HStack {
                            Text(item.sentence[0])
                            
                            Text(item.value)
                                .frame(minWidth: 40)
                                .padding(.vertical, 5)
                                .padding(.horizontal, item.padding)
                                .opacity(item.isShowing ? 1 : 0)
                                .background {
                                    Capsule()
                                        .fill(item.isShowing ? Color("mainGreen") : .gray.opacity(0.25))
                                }
                                .overlay(Capsule().stroke(Color("defaultLightGray"), lineWidth: 1.5))
                                .background {
                                    // when item is dropped into correct place
                                    Capsule()
                                        .stroke(.white)
                                        .opacity(item.isShowing ? 1 : 0)
                                }
                                .onDrop(of: [.url], isTargeted: .constant(false)) { providers in
                                    
                                    if let first = providers.first {
                                        let _ = first.loadObject(ofClass: URL.self) { value, error in
                                            guard let url = value else { return }
                                            
                                            print(url)
                                            
                                            if item.id == "\(url)" {
                                                
                                                droppedCount += 1
                                                // it's going to be less than 1
                                                let progress = (droppedCount/(CGFloat(characters.count)))
                                                
                                                withAnimation {
                                                    item.isShowing = true
                                                    updateShuffledArray(character: item)
                                                    
                                                    self.progress = progress
                                                    
                                                    if self.progress == 1 {
                                                        shouldReviseDragDropExercice.toggle()
                                                    }
                                                }
                                            } else {
                                                // animation of wrong answer
                                                // MARK: - TO-DO:
                                                animateView() // OBS: doesnt work??
                                            }
                                        }
                                    }
                                    return false
                                }
                            
                            Text(item.sentence[1])
                        }
                        .font(.custom("Barlow-SemiBold", size: 20))
                        .foregroundColor(Color("defaultOffWhite"))
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
                            .frame(minWidth: 40)
                            .clipShape(Capsule())
                            .font(.custom("Barlow-SemiBold", size: 20))
                            .foregroundColor(Color("mainBlue"))
                            .padding(.vertical, 5)
                            .padding(.horizontal, item.padding)
                            .opacity(item.isShowing ? 0 : 1)
                            .background {
                                Capsule()
                                    .foregroundColor(item.isShowing ? Color(.clear) : Color("defaultOffWhite"))
                            }
                            .onDrag {   // return id to find which item is moving
                                return .init(contentsOf: URL(string: item.id))!
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

struct EcoutePhrasesExerciceView: View {
    // MARK: - Ecoute Phrases Exercice
    @State var shouldReviseEcouteExercice: Bool
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.gray.opacity(0.25))
                
                Capsule()
                    .fill(Color("mainGreen"))
                    .frame(width: geometry.size.width * progress)
            }
        }.frame(height: 20).padding(.horizontal).padding(.top)
        
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Button {
                        // play audio
                        // change color of the play
                        print("aaaa")
                    } label: {
                        Image("audioButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tint(Color("mainBlue"))
                    }
                    .frame(width: 42, height: 42)
                    
                    Text("On écoute les phrases!")
                        .font(.custom("Barlow-SemiBold", size: 20))
                        .underline()
                }
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Button {
                            // play audio
                            // change color of the play
                            print("aaaa")
                        } label: {
                            Image("audioButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tint(Color("mainBlue"))
                        }
                        .frame(width: 35, height: 35)
                        
                        
                        Text("Je suis un facteur. ✉️")
                            .font(.custom("Barlow-Regular", size: 20))
                    }
                    
                    HStack {
                        Button {
                            // play audio
                            // change color of the play
                            print("aaaa")
                        } label: {
                            Image("audioButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tint(Color("mainBlue"))
                        }
                        .frame(width: 35, height: 35)
                        
                        
                        Text("Tu es mon copain. ❤️")
                            .font(.custom("Barlow-Regular", size: 20))
                    }
                    
                    HStack {
                        Button {
                            // play audio
                            // change color of the play
                            print("aaaa")
                        } label: {
                            Image("audioButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tint(Color("mainBlue"))
                        }
                        .frame(width: 35, height: 35)
                        
                        
                        Text("Elle est dans un train. 🚂")
                            .font(.custom("Barlow-Regular", size: 20))
                    }
                    
                    HStack {
                        Button {
                            // play audio
                            // change color of the play
                            print("aaaa")
                        } label: {
                            Image("audioButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tint(Color("mainBlue"))
                        }
                        .frame(width: 35, height: 35)
                        
                        
                        Text("Nous sommes en voyage. ✈️")
                            .font(.custom("Barlow-Regular", size: 20))
                            .foregroundStyle(.white)
                    }
                    
                }
            }.foregroundStyle(.white)
            
            Spacer()
            
            Button {
                print("aa")
            } label: {
                Text("CONTINUAR")
                    .font(.custom("Barlow-Bold", size: 20))
                    .foregroundColor(shouldReviseEcouteExercice ? Color(.white) : Color("defaultDarkBlue") )
            }
            .disabled(!shouldReviseEcouteExercice)
            .frame(width: 330, height: 50)
            .clipShape(Capsule())
            .background(
                Capsule()
                    .foregroundColor(shouldReviseEcouteExercice ? Color("mainGreen") :  Color("darkGray") ) )
            .padding(.bottom)
        }.padding(.top, 50)
    }
}
