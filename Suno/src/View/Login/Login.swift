//
//  Login.swift
//  Suno
//
//  Created by Tarun on 19/04/23.

import SwiftUI
import SwiftUIX

struct Login: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("img1")
                
                Text("OTP Verification")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                
                Text("We will send you an \(Text("One Time Password").fontWeight(.bold).foregroundColor(.label)) on this mobile number")
                    .font(.callout)
                    .foregroundColor(.systemGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
//                Text("Enter Mobile Number")
//                    .font(.callout)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.systemGray)
//                    .padding()
                
                HStack(spacing: 0) {
                    Button(action: {
                        print("+91 clicked")
                    }, label: {
                        Text("+91")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.label)
                            .frame(maxWidth: 60, maxHeight: .infinity)
                    })
                    .background(Color.secondarySystemBackground)
                    Spacer(minLength: 8)
                    TextField(text: $viewModel.phoneNumber)
                        .font(.title2)
                        .frame(maxHeight: .infinity)
                        .keyboardType(.phonePad)
                        .background(Color.secondarySystemBackground)
                        .placeholder(when: viewModel.phoneNumber.isEmpty) {
                            Text("Mobile Number")
                                .foregroundColor(.label)
                                .bold()
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .padding()
                
                Divider()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.label)
                    .padding()
                
                Button(action: {
                    withAnimation {
                        viewModel.sendCode()
                    }
                }, label: {
                    Text("Send OTP")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color("Primary"))
                        .cornerRadius(6)
                        .shadow(color: Color("Primary").opacity(0.8), radius: 6, x: 1, y: 1)
                        
                }).padding()
            }
            .blur(radius: viewModel.isLoading || viewModel.isVerify || viewModel.isVerified ? 20 : 0)
            
            if viewModel.isLoading {
                Loading()
            }
            
            Verification(viewModel: viewModel)
                .opacity(viewModel.isVerify ? 1 : 0)
                .scaleEffect(CGSize(width: viewModel.isVerify ? 1 : 0, height: viewModel.isVerify ? 1 : 0), anchor: .center)
                .animation(.interpolatingSpring(stiffness: 200, damping: 10, initialVelocity: 5))
            
            Done()
                .opacity(viewModel.isVerified ? 1 : 0)
                .scaleEffect(CGSize(width: viewModel.isVerified ? 1 : 0, height: viewModel.isVerified ? 1 : 0), anchor: .center)
                .animation(.interpolatingSpring(stiffness: 200, damping: 10, initialVelocity: 5))
        }
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"), message: Text(viewModel.errorMsg))
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct Loading: View {
    var body: some View {
        ProgressView()
    }
}
