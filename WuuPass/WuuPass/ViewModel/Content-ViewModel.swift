//
//  Content-ViewModel.swift
//  WuuPass
//
//  Created by Tindwende Thierry Sawadogo on 9/12/22.
//

import Foundation
import SwiftUI


extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var length = 10
        
        init() {
            
            createPassword()
            
        }
        
        func createPassword() {
            let alpabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alpabet + "1234567890"
            var newPassword = ""
            
            if containsSymbols {
                base += "!`~@#$%^&*()_+*-+=_'?/.>,<:[]{}"
            }
            
            if containsUppercase {
                base += alpabet.uppercased()
            }
            
            
            for _ in 0..<length {
                let ranChar = base.randomElement()!
                newPassword += String(ranChar)
            }
            
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
    }
}
