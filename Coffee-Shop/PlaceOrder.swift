//
//  PlaceOrder.swift
//  Coffee-Shop
//
//  Created by Siddharth Ganesan on 12/12/21.
//

import SwiftUI

func getDate(form: String)->String{
    let time = Date()
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = form
    let stringDate = timeFormatter.string(from: time)
    return stringDate
}

struct PlaceOrder : View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var showingPopover = false
    private var total: Int = 0
    @StateObject var data = UserData()
    @EnvironmentObject var hist: env
    var body: some View {
        VStack {
            Text("Order For")
                .font(.system(size:25))
            Text(getDate(form: "MMM dd, yyyy a"))
                .font(.system(size:25))
            
            Text("Number of Items: \(data.itemList.count)")
                .offset(y:10)
            
            List(0..<data.itemList.count, id: \.self) { i in
                HStack(spacing: 20) {
                    Image("\(data.itemList[i].components(separatedBy: "-")[0].trimmingCharacters(in: .whitespaces).lowercased())")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius:15)
                    Divider()
                    Text("\(data.itemList[i])")
                        .frame(width: 150, height: 50)
                    Text("$\(String(hist.prices[data.itemList[i]]!))")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .offset(y:10)
            .cornerRadius(20)

            Text("Total Price: $\(data.total)")
                .font(.system(size:25))

            
            Button("Add Item") {
                showingSheet.toggle()
            }
            .padding()
            .frame(width: 300, height: 60)
            .foregroundColor(.blue)
            .cornerRadius(10)
            .font(.system(size:25))
            .fullScreenCover(isPresented: $showingPopover) {
                Text("Your order has been submitted!")
                    .padding()
                    .offset(y:-110)
                    .font(.system(size:30, weight: .semibold))
                Button(action: {
                    showingPopover.toggle()
                }) {
                    Text("Dismiss")
                        .font(.system(size:25))
                        .padding()
                        .frame(width: 300, height: 60)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .fullScreenCover(isPresented: self.$showingSheet) {
                AddItem(isPresented: self.$showingSheet, data: data)
            }
            
            if (data.itemList.count != 0) {
                Button(action: {
                    data.itemList.insert(getDate(form: "MM/dd/yyyy"), at: 0)
                    data.itemList.insert(String(data.total), at: 1)
                    hist.OrderHistory.append(data.itemList)
                    data.itemList.removeAll()
                    data.total = 0
                    showingPopover = true
                }) {
                    Text("Submit Order")
                        .font(.system(size:25))
                        .padding()
                        .frame(width: 300, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

