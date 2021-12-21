//
//  SizeView.swift
//  Coffee-Shop
//
//  Created by Siddharth Ganesan on 12/12/21.
//

import SwiftUI


struct SizeView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    @ObservedObject var data: UserData
    
    @EnvironmentObject var hist: env
    var body: some View {
        let itemName = data.itemList[data.itemList.count-1].copy() as! String

        VStack {
            Text("Size Selection")
                .padding()
                .offset(y:-110)
                .font(.system(size:30, weight: .semibold))
            Button(action: {
                data.itemList[data.itemList.count - 1] = itemName + " - Small"
                data.total += Int(hist.prices[data.itemList[data.itemList.count - 1]]!)
                dismiss()
            }) {
                Text("Small ($\(Int(hist.prices[data.name + " - Small"]!)))")
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.system(size:25))
            }
            
            Button(action: {
                data.itemList[data.itemList.count - 1] = itemName + " - Medium"
                data.total += Int(hist.prices[data.itemList[data.itemList.count - 1]]!)
                dismiss()
            }) {
                Text("Medium ($\(Int(hist.prices[data.name + " - Medium"]!)))")
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.system(size:25))
            }
            
            Button(action: {
                data.itemList[data.itemList.count - 1] = itemName + " - Large"
                data.total += Int(hist.prices[data.itemList[data.itemList.count - 1]]!)
                dismiss()
            }) {
            
                Text("Large ($\(Int(hist.prices[data.name + " - Large"]!)))")
                .padding()
                .frame(width: 300, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.system(size:25))
            }
        }
    }
}

