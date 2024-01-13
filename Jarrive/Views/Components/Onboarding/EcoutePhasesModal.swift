//
//  EcoutePhasesModal.swift
//  Jarrive
//
//  Created by Ronald on 14/12/23.
//

import SwiftUI

struct EcoutePhasesModal: View {
    @Binding var shouldShowEcouteModal: Bool
    @Binding var shouldShowEcouteView: Bool
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                VStack {
                    Spacer ()
                    
                    Image("tres-bien")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 277, height: 343)
                    
                    
                    Text("On écoute les phrases!")
                        .font(.custom("Barlow-Bold", size: 30))
                        .foregroundColor(.white)
                    
                    Spacer ()
                }
                
                Button {
                    shouldShowEcouteModal = false
                    shouldShowEcouteView = true
                } label: {
                    Text("CONTINUAR")
                        .font(.custom("Barlow-Bold", size: 20))
                        .foregroundColor(.white)
                }
                .frame(width: 330, height: 50)
                .clipShape(Capsule())
                .background(Capsule().foregroundColor(Color("mainGreen")))
                .contentShape(Rectangle())
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("defaultDarkBlue"))
        }
    }
}

struct EcoutePhasesModal_Previews: PreviewProvider {
    static var previews: some View {
        @State var shouldShowEcouteModal: Bool = true
        @State var shouldShowEcouteView: Bool = true
        EcoutePhasesModal(shouldShowEcouteModal: $shouldShowEcouteModal,
                          shouldShowEcouteView: $shouldShowEcouteView)
    }
}
