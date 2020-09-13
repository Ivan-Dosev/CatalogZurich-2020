//
//  ContentView.swift
//  CatalogZurich
//
//  Created by Ivan Dosev Dimitrov on 13.09.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State  var sizeFond : CGFloat = UIScreen.main.bounds.width / 1.2

    @State var isShow : Bool = false

    
    var body: some View {
        VStack {
            Group{
                Text("ZURICH")
                    .font(.custom("Raffina", size: sizeFond / 6))
                    .foregroundColor(Color(.green))
                Text("2020")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("calculator antibiotics")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding()
            .offset( y: -100)
            
            Button(action: { self.isShow.toggle()


            }) {
                VStack{

                    
                         LottieView(filename: "a567", isPaused: isShow)
                        .frame(width: sizeFond / 3, height:sizeFond / 3 )
                        .background(Color
                            .white
                            .opacity(0.4)
                            .frame(width: sizeFond / 2, height: sizeFond / 2)
                            .cornerRadius(30)
                            
                            .rotation3DEffect(.init(degrees: 10), axis: (x: 0, y: 1, z: 0)) )
                            .shadow(color: Color.black, radius: 9, x: 5, y: 5)
                        
                        .padding()
                    
                    Text("start")
                       .font(.system(size:  sizeFond / 10))
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black, radius: 5)
                    .offset( y: -(sizeFond / 10))
                    }

                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
