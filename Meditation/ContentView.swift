//
//  ContentView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var BtnLogin = false
    @State var BtnRegister = false
    var body: some View {
        NavigationView{
        ZStack {
            Image("Onboarding")
                .resizable()
            VStack(alignment: .center, spacing: 5) {
                Spacer()
                Button(action: {
                    BtnLogin.toggle()
                }) {
                    Text("Войти в аккаунт")
                        .foregroundColor(Color.white)
                        .frame(width: 320, height: 60, alignment: .center)
                        .background(Color(hex: "#7C9A92"))
                        .cornerRadius(10)
                }
                NavigationLink("", isActive: $BtnLogin) {
                    LoginView()
                }
                
                HStack {
                    Text("Еще нет аккаунта?")
                        .foregroundColor(Color.white)
                    Button(action: {
                        BtnRegister.toggle()
                    }) {
                        Text("Зарегистрируйтесь")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    }
                    NavigationLink("", isActive: $BtnRegister){
                        RegisterView()
                    }
                }
            
            }
            .padding(.bottom, 60)
            
        }
        .ignoresSafeArea(.all)
    }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
