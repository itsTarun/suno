//
//  SignUp.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI
import Firebase

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .textCase(.lowercase)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    // register
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.blue, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    // login
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        action()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as? AuthErrorCode {
                switch error.code {
                case .emailAlreadyInUse:
                    action()
                default:
                    print(error)
                    break
                }
            }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error as? AuthErrorCode {
                print(error)
            } else {
                action()
            }
        }
    }
}

//struct SignUp_Previews: PreviewProvider {
//    @State var isUserLoggedIn = false
//    static var previews: some View {
//        SignUp(userIsLoggedIn: $isUserLoggedIn)
//    }
//}
