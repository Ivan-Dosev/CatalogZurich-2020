//
//  Tab10Card.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 27.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10Card: View {
    var dossi : String
 // var lek   : String
    var vid   : String
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
      
            VStack {
                HStack {
                    Spacer()
                    Text("\(vid)")
                      .padding()
                    Spacer()
                }.background(Color.green)
                 .foregroundColor(Color.white)
                ScrollView(.vertical, showsIndicators: true) {
                    Text("\(dossi)")
                        .padding()
                }
                Spacer()
//                Divider()
//                Text("\(lek)")
//                .padding()
            }
            .frame(width: self.width > 600 ? self.width / 1.7 : self.width / 1.1, height: 525)
            .foregroundColor(.secondary)
            .background(Color("mecho"))
            .cornerRadius(25)
       
    }
}

struct Tab10Card_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Card(dossi: "111", vid: "333")
    }
}
