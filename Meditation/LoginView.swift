//
//  LoginView.swift
//  Meditation
//
//  Created by Student on 28.04.2022.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var alert: String = ""
    @State var BtnLogin = false
    @State var BtnRegister = false
    @State var ShowAlert = false
    var body: some View {
        ZStack {
            Image("Register")
                .resizable()
            VStack {
                VStack(alignment: .leading) {
                    Image("Logo-7")
                        .padding(.leading, -120)
                    Text("Sign in")
                        .foregroundColor(Color.white)
                        .font(.title)
                        .padding(.top, -100)
                }
                .padding(.leading, -100)
                
                VStack {
                    TextField("Email", text: $login)
                        .foregroundColor(Color.white)
                        .padding(.top, 10)
                    Divider()
                        .background()
                    SecureField("Пароль", text: $password)
                        .foregroundColor(Color.white)
                        .padding(.top, 10)
                    Divider()
                        .background()
                        .padding(.bottom, 50)
            
                    Button(action: {
                        if (login.isEmpty || password.isEmpty) {
                            alert = "Заполните все поля данными"
                            ShowAlert = true
                        }
                        else {
                            if (!login.contains("@")) {
                                alert = "Email должен содержать знак '@'"
                                ShowAlert = true
                            }
                            else {
                                alert = ""
                                ShowAlert = false;
                                BtnLogin.toggle()
                                
                                loginUser(login: login, password: password) { result in switch result {
                                case .success(let token):
                                                            UserDefaults.standard.set(token, forKey: "token")
                                                            UserDefaults.standard.set(true, forKey: "auth")
                                                        case .failure(let error):
                                                            print(error.localizedDescription
                                    )
                                }
                                    
                                }
                            }
                        }
                    }) {
                        Text("Sign in")
                            .foregroundColor(Color.white)
                            .frame(width: 320, height: 60, alignment: .center)
                            .background(Color(hex: "#7C9A92"))
                            .cornerRadius(10)
                    }
                    .alert(alert, isPresented: $ShowAlert) {
                        Button("OK", role: .cancel, action: {
                            //
                        })
                    }
                    NavigationLink("", isActive: $BtnLogin) {
                        MainUserView()
                    }
                    
                    Button(action: {
                        BtnRegister.toggle()
                    }) {
                        Text("Register")
                            .foregroundColor(Color.white)
                            .frame(width: 320, height: 60, alignment: .center)
                            .background(Color(hex: "#7C9A92"))
                            .cornerRadius(10)
                    }
                    NavigationLink("", isActive: $BtnRegister) {
                        RegisterView()
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .ignoresSafeArea(.all)
    }
}


func loginUser(login: String, password: String, completion: @escaping(Result<String, Error>) -> Void){
    let url = "mskko2021.mad.hakta.pro/api/user/login"
    let parameters: HTTPHeaders = ["email": login, "password": password]
    
    AF.request(url, method: .post, headers: parameters).validate().responseJSON{ response in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    let token = json["token"].stringValue
                    completion(.success(token))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

