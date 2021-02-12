//
//  Tab10ZStackSheet.swift
//  CatalogAugust
//
//  Created by Ivan Dosev Dimitrov on 23.08.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10ZStackSheet: View {
    
       @Environment(\.presentationMode) var pMode
       @Binding var isOnButton : Bool
       @State var width = UIScreen.main.bounds.width
       
       @State   var isPro         : Bool = false
       @State   var isMaxDoza     : Bool = false
       
       @Binding var value         : Float
                var detaill       : String
                var lek           : String
                var mjarka        : String
                var grupa         : String
    
           var stepI : [String]{
           
               return self.detaill.components(separatedBy: " ")
           }
       

        // mg/day
        
        var priemD : [String] {
                                priemDay()
        }
        var dayOT : String {
            if self.priemD.count >= 2 {
                return self.priemD[0]
            }
            return "0"
        }
        var dayDO : String {
            if self.priemD.count == 3 {
                                  return self.priemD[1]
            }
            if self.priemD.count == 2 {
                                   return self.priemD[0]
            }
            return "0"
        }
        var dayOTfloat : Float {
                                  Float ( String( self.dayOT)) ??  0
        }
        var dayDOfloat : Float {
                                  Float ( String( self.dayDO)) ??  0
        }
        
        

        var priem : [String] {

                  prieM()

        }
        
        
        var priemOt : String {
            if self.priem.count >= 2 {
                return self.priem[0]
            }
            return "0"
        }
        var priemDo : String {
            if self.priem.count == 3 {
                                  return self.priem[1]
            }
            if self.priem.count == 2 {
                                   return self.priem[0]
            }
            return "0"
        }
    // kantar
        var kantar : String {
                             kantarPazient()
        }
        var kantarFloat : Float {
                             Float ( String (self.kantar)) ?? 0
        }
        @State var isKanter : Bool = false
        
        
    // max dosa
        var maxDosa : String {
                             maxdosa()
        }
        var maxDosaFloat : Float {
                            Float ( String( self.maxDosa)) ??  0
        }
        
      //  kraj  max dosa
        
        
        var timesOfDay : String {
                               tootime()
        }
        
     //  2_3_time_a_day
        
        var timesToDays : [String] {
                                   toTimes()
        }
        var timeOt : String {
            if self.timesToDays.count >= 4 {
                                         return self.timesToDays[0]
            }
            return "0"
        }
        var timeDo : String {
            if self.timesToDays.count == 5 {
                                         return self.timesToDays[1]
            }
            if self.timesToDays.count == 4 {
                                         return self.timesToDays[0]
            }
            return "0"
        }
        var timeOtFloat : Float {
                                Float (String(self.timeOt)) ?? 1
        }
        var timeDoFloat : Float {
                                Float (String(self.timeDo)) ?? 1
        }
        // краи
        
       // tit-tit
        var titOTtit : String {
                                       loadTit()
        }
        // краи
        
        // Lday
        
        var ldayOTlday : String {
                               loadLday()
        }
        
        // краи
        
        // парва доза
        var fierstDoze : String {
                                 primDozze()
        }
        var fierstDozeFloat : Float {
                            Float ( String( self.fierstDoze)) ??  0
        }
        //краи парва доза
        
           var otFloat : Float {
                            Float ( String( self.priemOt)) ??  0
             }
           var doFloat : Float {
                            Float ( String( self.priemDo)) ??  0
           }
          var timeFloat : Float {
                             Float ( String( self.timesOfDay)) ??  1
           }
     
        var isShow : Bool {
            if self.otFloat == self.doFloat {
                               return true
            }else {
                               return false
            }
        }
        var isRawno : Bool {
            if self.otFloat == self.doFloat {
                        return false
            }else{
                        return true
            }
        }
        
        var otForTxt : Float {
            (otFloat * value ) / timeFloat
        }
        var doForTxt : Float {
            (doFloat * value ) / timeFloat
        }

        @State var indexButton = 0
         
        @State var im : [Double] = [1,0,0,0,0,0]

        
        @State var isLoading            : Bool = true
        @State private var isShowing    : Bool = true
        @State private var   isPaused   : Bool = false
    
        @State private var   risK          : String = ""
        @State private var   dosazE        : String = ""
        @State private var   propeR        : String = ""
        @State private var   carefuL       : String = ""
        @State private var   effectS       : String = ""

         @ObservedObject var recModel               =  Recarstvo()
    
     var models : [ItemsLottie] = [
        ItemsLottie(id: 0, text: "Calc",    image: "12345", literal: "Calculator"),
        ItemsLottie(id: 0, text: "Dose",    image: "6789", literal: "Dosage"),
        ItemsLottie(id: 0, text: "Risk",    image: "6789", literal: "Risk"),
        ItemsLottie(id: 0, text: "Use",     image: "6789", literal: "Usage"),
        ItemsLottie(id: 0, text: "Alert",   image: "6789", literal: "Alert"),
        ItemsLottie(id: 0, text: "Side-E",   image: "6789", literal: "Effect")

      ]
      
    @State var number = 0
       
    
    var body: some View {
        VStack {
        

                      HStack {
                          Button(action: {
                                           self.isOnButton = false
                                           self.pMode.wrappedValue.dismiss()
                              
                          }) {
                              Text("⏎")
                              .padding(.top)
                              .foregroundColor(.white)
                          }
                         Spacer()
                              Text("\(lek)")
                                  .padding(.top)
                                  .font(.system(size: 25))
                                  .foregroundColor(.white)
                                  
                                  
                                  
                          Spacer()
                          Button(action: {
                                           self.isPro.toggle()
                                      }) {
                                          Text("💊")
                                          .padding(.top)
                                          .foregroundColor(.white)
                                          
                                          //.sheet(isPresented: self.$isPro, content:{ Tab10Sheet(isPro: self.$isPro, txt: self.lek)})
                                      }
                      }
                      .padding()
                     // .padding(.top , 40)
                      .background(Color("greenCatallog"))
        

           Spacer()
            
                HStack{
                  ForEach(Array(zip(models.indices, models)) ,id: \.0) { index , item in
                
                    ButtonView(index: index, text: item.text, image: item.image, literal: item.literal, number: self.$number, isShow: self.number == index ? .constant(false) : .constant(true))
                    }
                }
               .offset( y: -50)
               .frame(width: self.width > 600 ? self.width / 1.5 : self.width / 1.1)
           

            
        ForEach(recModel.database200.filter{ $0.lekarstvo.lowercased() == (lek.lowercased())} ,id: \.lekarstvo) { item in
                     Text("")
                        .onAppear{
                            self.effectS = item.effects
                            self.risK    = item.risk
                            self.dosazE  = item.dosage
                            self.propeR  = item.proper
                            self.carefuL = item.careful
                       }

            }
             
            VStack {
            ZStack(alignment: .topLeading) {
                
                   if self.number == 0 {
                       Tab10CardCalculator(titOTtit: self.titOTtit, ldayOTlday: self.ldayOTlday, dayOTfloat: self.dayOTfloat, dayDOfloat: self.dayDOfloat, kgOTfloat: self.otFloat, kgDOfloat: self.doFloat, timeOTfloat: self.timeOtFloat, timeDOfloat: self.timeDoFloat, fierstDozeFloat: self.fierstDozeFloat, maxDozeFloat: self.maxDosaFloat, lek: self.lek, mjarka: self.mjarka, value: self.value, kantar: self.kantarFloat)
                        .transition(AnyTransition.slide)
                        .animation(.default)
                   }
                
                    if self.number == 1 {
                        Tab10DozaNew(isbor: self.detaill  , dossi: dosazE , vid: " What is the dosage:")
                        .transition(AnyTransition.slide)
                            .animation(.default)
                    }

                    if self.number == 2 {
                        Tab10Card(dossi: risK,  vid: "What is the risk:")
                        .transition(AnyTransition.slide)
                            .animation(.default)
                    }
                              
                    if self.number == 3 {
                        Tab10Card(dossi: propeR,  vid: "What is the proper use:")
                        .transition(AnyTransition.slide)
                            .animation(.default)
                    }
                    if self.number == 4 {
                        Tab10Card(dossi: carefuL,  vid: "What should we be careful for:")
                        .transition(AnyTransition.slide)
                            .animation(.default)
                    }
                            
                    if self.number == 5 {
                        Tab10Card(dossi: effectS ,  vid: "Side effects:")
                        .transition(AnyTransition.slide)
                            .animation(.default)
                    }
        

           
                }
            }
            //.frame(width: UIScreen.main.bounds.width / 1.1 , height: 525)
              .frame(width: self.width > 600 ? self.width / 1.5 : self.width / 1.1 , height: 525)
             .offset( y: -25)
              
          
            

            
           Spacer()
              
        }
         .background(Color("greenCatallog").opacity(0.1))
         .edgesIgnoringSafeArea(.all)
         .sheet(isPresented: self.$isPro, content:{ Tab10Pro(txt: self.lek, isPro: self.$isPro)})
       
    }
    
//    func loadData(){
//            recModel.database200.filter{$0.lekarstvo.lowercased() == lek.lowercased()} .forEach { item in
//            self.effectS = item.effects
//            self.risK    = item.risk
//            self.dosazE  = item.dosage
//            self.propeR  = item.proper
//            self.carefuL = item.careful
//
//        }
//        self.risK = "aa...aa..aa..aa"
//
//    }
  
        func prieM() -> [String] {
           
            var arda : [String]  = []
           
            for alo in stepI.filter({$0.contains("/kg")}) {
                if  alo != "" {
//                   print("dossi \(pri)")
                    arda = alo.components(separatedBy: "_")
                  // print("<\(arda.count)>")
                  
                }
            }
            return arda
        }
       
       
       // priem/day
       
       func priemDay() -> [String] {
           
       var prday : [String] = []
           
            for alo in stepI.filter({$0.contains("/day")}) {
                if  alo != "" {
//                   print("arda \(day)")
                   prday = alo.components(separatedBy: "_")
               }
           }
           
           return prday
       }
       // krai
       
       
       
       // 2_3_time_a_day
       
       func toTimes() -> [String] {
           
           var toTime : [String] = []
           for tri in stepI.filter({$0.contains("times_a_day")}) {
            if  tri  != "" {
                  
                   toTime = tri.components(separatedBy: "_")
                 //  print ("dossi \(tt) - count \(toTime.count)")
               }
           }
           
           return toTime
       }
       // краи 2_3_time_a_day

       func primDozze() -> String {
           var prinD        : String   = "0"
           var primDmax     : [String] = []
           for alo in stepI.filter({$0.contains("_prim")}) {
            if  alo  !=  "" {
                   primDmax = alo.components(separatedBy: "_")
                   return primDmax[0]
               }
           }
           return prinD
       }
       
        
        func tootime() -> String {
              var mecho    : String     = "0"
              var mechoI   : [String]   = []
             for alo in stepI.filter({$0.contains("times_a_day")}) {
                if alo != "" {
              //  print("\(mecho)...")
                mechoI = alo.components(separatedBy: "_")
              //  print("\(mechoI[0])")
               return mechoI[0]
              }
            }
            return mecho
        }
        
        func maxdosa() ->String {
            
            var arda : String = "0"
            var ardaI  : [String] = []
            
            for alo in stepI.filter({$0.contains("maxDD")}) {
                if alo  != "" {
                  //  print("\(arda)...")
                    ardaI = alo.components(separatedBy: "_")
                 //   print("\(ardaI[2])")
                    return ardaI[0]
                  }
            }

            return arda
        }
       
       func kantarPazient() ->String {
           
           var arda : String = "0"
           var ardaI  : [String] = []
           
           for alo in stepI.filter({$0.contains("kantar")}) {
            if alo != ""  {
                 //  print("\(arda)...")
                   ardaI = alo.components(separatedBy: "_")
                //   print("\(ardaI[2])")
                   return ardaI[0]
                 }
           }

           return arda
       }
       
       func loadTit() -> String {
     
                        var tit    : String = "0"
                        var titTit : [String] = []
             for alo in stepI.filter({$0.contains("tit/tit")}) {
                if alo != "" {
                   titTit = alo.components(separatedBy: "_")
                  // print("\(titTit[0]) ... tit")
                   return titTit[0]
               }
           }
           return tit
       }
       
       func loadLday() -> String {
           var lday    : String = "0"
           var ldayDay : [String] = []
            for alo in stepI.filter({$0.contains("Lday")}) {
                if alo  != ""{
                   
                   ldayDay = alo.components(separatedBy: "_")
                   return ldayDay[0]
                   
               }
           }
           return lday
       }
     
}

struct Tab10ZStackSheet_Previews: PreviewProvider {
    static var previews: some View {
        Tab10ZStackSheet(isOnButton: Binding.constant(false), value: Binding.constant(40), detaill: "111", lek: "222", mjarka: "aa", grupa: "eee")
    }
}

struct ButtonView: View {
             var index   : Int
             var text    : String
             var image   : String
             var literal : String
    @Binding var number  : Int
    
    @Binding var isShow : Bool
    @State var width = CGFloat( UIScreen.main.bounds.width * ( 1 / 7.5 ) )
    
    var body: some View {
        VStack {
            Button(action: {
                self.number = self.index
                if self.number == self.index {
                                  self.isShow = true
                }else{
                                  self.isShow = false
                }
              
            }) {
                VStack{
                    if !isShow{
                    LottieView(filename: image , isPaused: isShow)
                        .frame(width: self.width, height: self.width )
                        .background(Color
                            .white
                            .opacity(0.4)
                            .frame(width: self.isShow ? self.width : self.width / 2 , height: self.width)
                            .cornerRadius(10)
                            
                            .rotation3DEffect(.init(degrees: 10), axis: (x: 0, y: 1, z: 0)) )
                            .shadow(color: Color.black, radius: 5, x: 3, y: 3)
                        
                            .padding()
                    }

                    Text( isShow ? text : literal)
                    
                        
                        //.font(.title)
                        .fontWeight(.bold)
                        .offset( y: self.isShow ? 0 : -20)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black, radius: 3)
                    
                }
                .frame(width: self.width, height: self.width)
                .background(Color
                    .white
                    .opacity(0.4)
                .frame(width: self.isShow ? self.width : self.width / 2, height: self.width / 2)
                    .cornerRadius(5))
                    
                 


            }
        }
    }
}

struct  ItemsLottie : Identifiable , Hashable{
    var id      : Int
    var text    : String
    var image   : String
    var literal : String
}
