//
//  UserNewsView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI

struct UserNewsView: View {
    var body: some View {
        ZStack {
            Color(hex: "#253334")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("С возращением, Эмиль!")
                    .foregroundColor(Color.white)
                    .font(.title)
                Text("Каким ты ощущаешь себя сегодня?")
                    .foregroundColor(Color.gray)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        Image("Calm")
                        Image("Anxious")
                        Image("Focus")
                        Image("Relax")
                    }
                
                }
            }
        }
    
    }
}

struct UserNewsView_Previews: PreviewProvider {
    static var previews: some View {
        UserNewsView()
    }
}
