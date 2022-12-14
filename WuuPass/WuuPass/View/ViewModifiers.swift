//
//  ViewModifiers.swift
//  WuuPass
//
//  Created by Tindwende Thierry Sawadogo on 9/12/22.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
        }
    }
}
