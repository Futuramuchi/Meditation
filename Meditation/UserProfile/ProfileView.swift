//
//  ProfileView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(hex: "#253334")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Profile Pic")
                Text("Эмиль")
                    .font(.title)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
