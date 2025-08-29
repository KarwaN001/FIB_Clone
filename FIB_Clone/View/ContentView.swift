//
//  ContentView.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BottomNavigationView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct BottomNavigationView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BottomNavigation {
        return BottomNavigation()
    }
    
    func updateUIViewController(_ uiViewController: BottomNavigation, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


