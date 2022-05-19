//
//  MainUserView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI

struct MainUserView: View {
    @State var selection = 0
    var body: some View {
                TabView(selection: $selection) {
                    UserNewsView()
                        .tabItem {
                            Image("Home")
                        }
                        .tag(0)
                    
                    MusicView()
                        .tabItem {
                            Image("Nav")
                        }
                        .tag(1)
                    
                    ProfileView()
                        .tabItem {
                            Image("Profile")
                        }
                        .tag(2)
            }
    }
}

struct MainUserView_Previews: PreviewProvider {
    static var previews: some View {
        MainUserView()
    }
}
