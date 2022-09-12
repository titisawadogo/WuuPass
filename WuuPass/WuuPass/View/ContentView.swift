//
//  ContentView.swift
//  WuuPass
//
//  Created by Tindwende Thierry Sawadogo on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form {
            Section("Parameters") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                    .tint(.purple)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                    .tint(.purple)
                Stepper("Character count: \(vm.length)", value: $vm.length, in: 6...18)
                Button("Generate password", action: vm.createPassword)
                    .centerH()
                    .foregroundColor(.purple)
                    .font(.system(size: 18, weight: .bold))
            }
            
            Section() {
                HStack{
                    Spacer()
                    VStack{
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.green)
                        Text("Strong")
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.yellow)
                        Text("Medium")
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.red)
                        Text("Weak")
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.gray)
                        Text("Simple")
                    }
                    Spacer()
                }
            }
            
            
            Section("Password(s)") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(password.strengthColor)
                    }
                }
              
                
            }
        }
        .addNavigationView(title: "WuuPass")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
