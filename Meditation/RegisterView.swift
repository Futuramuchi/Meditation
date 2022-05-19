//
//  RegisterView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        ZStack {
            Color(hex: "#253334")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Окно регистрации")
                    .foregroundColor(Color.white)
                    .font(.title)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
