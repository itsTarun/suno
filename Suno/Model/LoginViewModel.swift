//
//  LoginViewModel.swift
//  Suno
//
//  Created by Tarun on 20/04/23.
//

import Foundation
import Firebase
import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage(UserDefaultKeys.verificationId.rawValue) var verificationId: String = ""
    @Published var isLoading: Bool = false
    @Published var isLoadingVerify: Bool = false

    @Published var phoneNumber: String = ""
    @Published var countryCode: String = "+91"
    @Published var isVerify: Bool = false
    @Published var isVerified: Bool = false
    
    @Published var isError: Bool = false
    @Published var errorMsg: String = ""
    
    var fullNumber: String {
        return countryCode + phoneNumber
    }
}

extension LoginViewModel {
    
    func sendCode() {
        
        self.isLoading.toggle()
        
        PhoneAuthProvider.provider().verifyPhoneNumber(fullNumber, uiDelegate: nil) { (verificationId, error) in
            
            self.isLoading.toggle()
            
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            self.verificationId = verificationId ?? ""
            self.isVerify.toggle()
        }
    }
    
    func verifyCode(code: String) {
        
        self.isLoadingVerify.toggle()
        
        let credentials = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationId, verificationCode: code)
        
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            
            self.isLoadingVerify.toggle()
            
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            
            print(authResult ?? "")
            self.isVerify.toggle()
            self.isVerified.toggle()
        }
        
    }
}
