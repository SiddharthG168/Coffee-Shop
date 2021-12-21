//
//  AddItem.swift
//  Coffee-Shop
//
//  Created by Siddharth Ganesan on 12/12/21.
//

import SwiftUI


struct AddItem : View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    @ObservedObject var data: UserData
    
    @State private var showingSheet = false
    
    var body: some View {
        Text("Menu")
            .padding()
            .font(.system(size:30, weight: .semibold))
            .offset(y: 10)
        HStack {
            Button(action: {
                data.itemList += ["Coffee"]
                data.name = "Coffee"
                showingSheet.toggle()
            }) {
                GroupBox(content: {
                    Image("coffee")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Text("Coffee")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                    .padding()
            }
            
            
            Button(action: {
                data.itemList += ["Water"]
                data.name = "Water"
                showingSheet.toggle()
            }) {
                GroupBox(content: {
                    Image("water")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Text("Water")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                    .padding()
            }
        }
        
        HStack {
            Button(action: {
                data.itemList += ["Latte"]
                data.name = "Latte"
                showingSheet.toggle()
            }) {
                GroupBox(content: {
                    Image("latte")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Text("Latte")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                    .padding()
            }
            
            
            Button(action: {
                data.itemList += ["Smoothie"]
                data.name = "Smoothie"
                showingSheet.toggle()
            }) {
                GroupBox(content: {
                    Image("smoothie")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Text("Smoothie")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                    .padding()
            }
        }
        
        HStack {
            Button(action: {
                data.itemList += ["Tea"]
                data.name = "Tea"
                showingSheet.toggle()
            }) {
                GroupBox(content: {
                    Image("tea")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Text("Tea")
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .font(.system(size:25))
                })
                    .padding()
            }
        }
        
        .fullScreenCover(isPresented: self.$showingSheet) {
            SizeView(isPresented: self.$showingSheet, data: data)
        }
        
        Button(action: {
            dismiss()
        }) {
            Text("Show Cart")
                .padding()
                .frame(width: 300, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.system(size:25))
        }
    }
}

