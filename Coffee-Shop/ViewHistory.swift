//
//  ViewHistory.swift
//  Coffee-Shop
//
//  Created by Siddharth Ganesan on 12/12/21.
//

import SwiftUI

struct ViewHistory : View {
    @EnvironmentObject var hist: env
    var body: some View {
        Text("Order History")
            .padding()
            .offset(y:-20)
            .font(.system(size:30, weight: .semibold))

        List(0..<hist.OrderHistory.count, id: \.self) { item in
            VStack {

                GroupBox(label: Text("").frame(width:100),content: {

                    Text("Order For \(hist.OrderHistory[item][0])")
                        .foregroundColor(.black)
                        .font(.system(size:20, weight: .bold))
                        .offset(y:-10)
                    
                    Text("Bill Amount $\(hist.OrderHistory[item][1])")
                        .foregroundColor(.black)
                        .font(.system(size:15, weight: .semibold))
                        .offset(y:-10)
                    
                    ForEach(2..<hist.OrderHistory[item].count, id: \.self) { order in
                        Text("\(hist.OrderHistory[item][order])")
                            .foregroundColor(.black)
                            .font(.system(size:15))
                    }
                })
                    .shadow(radius: 10)

            }
            .padding(.horizontal)
        }
    }
}

