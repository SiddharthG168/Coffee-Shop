//
//  ContentView.swift
//  Coffee-Shop
//
//  Created by Siddharth Ganesan on 12/12/21.
//

import SwiftUI

class env: ObservableObject {
    @Published var OrderHistory = [[String]]()
    @Published var prices : [String:Int] = [
        "Coffee": 0,
        "Coffee - Small": 5,
        "Coffee - Medium": 6,
        "Coffee - Large": 7,
        "Water": 0,
        "Water - Small": 1,
        "Water - Medium": 2,
        "Water - Large": 3,
        "Latte": 0,
        "Latte - Small": 6,
        "Latte - Medium": 7,
        "Latte - Large": 8,
        "Smoothie": 0,
        "Smoothie - Small": 8,
        "Smoothie - Medium": 9,
        "Smoothie - Large": 10,
        "Tea": 0,
        "Tea - Small": 4,
        "Tea - Medium": 5,
        "Tea - Large": 6,
    ]
}

class UserData: ObservableObject {
    @Published var itemList = Array<String>()
    @Published var total = 0
    @Published var name = ""
}



struct ContentView: View {
    @StateObject var hist = env()
    var body: some View {
        NavigationView {
            VStack {
                Text("Swift Intro")
                    .padding()
                    .offset(y:-80)
                    .font(.system(size:45, weight: .semibold))
                Text("Coffee Shop")
                    .padding()
                    .offset(y:-110)
                    .font(.system(size:30))
                Image("coffee")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius:20)
                    .offset(y:-70)
                
                NavigationLink(destination: PlaceOrder(), label: {
                    Text("Place Order")
                        .padding()
                        .frame(width: 300, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                
                NavigationLink(destination: ViewHistory(), label: {
                    Text("View Order History")
                        .padding()
                        .frame(width: 300, height: 60)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                
            }
        }
        .environmentObject(hist)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


