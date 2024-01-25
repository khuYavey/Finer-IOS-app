//
//  mainpage.swift
//  Finer
//
//  Created by Коля Хамник on 12.05.2023.
//

import SwiftUI
struct ShowingSheetKey: EnvironmentKey {
    static let defaultValue: Binding<Bool>? = nil
}

extension EnvironmentValues {
    var showingSheet: Binding<Bool>? {
        get { self[ShowingSheetKey.self] }
        set { self[ShowingSheetKey.self] = newValue }
    }
}


//struct PopupView: View {
//var body: some View {
//
//        if isPresented {
//            ZStack {
//                HStack{
//                    Text("Processing")
//
//                        .font(.system(size: 22))
//                        .padding()
//                        .opacity(0.6)
//
//
//                    ProgressView()
//                        .padding()
//
//                }
//                HStack {
//                    Text("")
//                }
//                .frame(width: 250, height: 80)
//                .background(Color.gray)
//                .opacity(0.15)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//            }
//
//
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    withAnimation(.spring()){
//                        isPresented = false
//                    }}
//            }
//        }
////        if isSucces{
////            ZStack {
////                HStack{
////                    Text("Request sent")
////                        .font(.system(size: 22))
////                        .padding()
////                        .opacity(0.6)
////
////                    Image(systemName: "checkmark")
////                }
////                HStack {
////                    Text("")
////                }
////                .frame(width: 250, height: 80)
////                .background(Color.gray)
////                .opacity(0.15)
////                .cornerRadius(10)
////                .shadow(radius: 10)
////            }
////
////
////        }
//    }
//}
struct mainpage: View {
    
    @State var isShowSheet1 = false
    @State var isShowSheet2 = false
    @State var isShowSheet3 = false
    @State var isShowSheet4 = false
    @State var isShowSheet5 = false
    
    
    @State var isShowingPopup = false
    
    var body: some View {
        ZStack{
            NavigationView{
                Text("")
                    .navigationTitle("Правопорушення")
            }
            
            
        
            
            
               
            
            
            VStack{
                Text("")
                    .padding(20)
                Button(action: {
                    self.isShowSheet1.toggle()
                }) {
                    Text("Паркування на тротуарі")
                        .frame(width: 300,height: 70)
                    
                    
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                        .sheet(isPresented: $isShowSheet1) {
                            nocarzone()
                                .environment(\.showingSheet, self.$isShowSheet1)
                        }}
                .padding(15)
                
                Button(action: {
                    self.isShowSheet2.toggle()
                }) {
                    Text("Паркування заборонено")
                        .frame(width: 300,height: 70)
                    
                    
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                        .sheet(isPresented: $isShowSheet2) {
                            pavementreportView()
                                .environment(\.showingSheet, self.$isShowSheet2)
                        }}
                .padding(15)
                
                Button(action: {
                    self.isShowSheet3.toggle()
                }) {
                    Text("Паркування поза місцем для паркування")
                        .frame(width: 300,height: 70)
                    
                    
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                        .sheet(isPresented: $isShowSheet3) {
                            outsideslotView()
                                .environment(\.showingSheet, self.$isShowSheet3)
                        }}
                .padding(15)
                
                Button(action: {
                    self.isShowSheet4.toggle()
                }) {
                    Text("Паркування на зупинці громадського транспорту")
                        .frame(width: 300,height: 70)
                    
                    
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                        .sheet(isPresented: $isShowSheet4) {
                            busstopreportView()
                                .environment(\.showingSheet, self.$isShowSheet4)
                        }}
                .padding(15)
                
                Button(action: {
                    self.isShowSheet5.toggle()
                }) {
                    Text("Паркування біля пішохідного переходу")
                        .frame(width: 300,height: 70)
                    
                    
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                        .sheet(isPresented: $isShowSheet5) {
                            crosswalkreportView()
                                .environment(\.showingSheet, self.$isShowSheet5)
                        }}
                .padding(15)
            }
            
        


                if isShowingPopup {
                    Color.white.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    ZStack {
                        HStack{
                            Text("Обробка")
                            
                                .font(.system(size: 22))
                                .padding()
                                .opacity(0.6)
                            
                            
                            ProgressView()
                                .padding()
                            
                        }
                        HStack {
                            Text("")
                        }
                        .frame(width: 250, height: 80)
                        .background(Color.gray)
                        .opacity(0.15)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeOut(duration: 0.5)){
                                isShowingPopup.toggle()
                            }}
                    }
                }
            
            
        }
        
    }
}



struct mainpage_Previews: PreviewProvider {
    static var previews: some View {
        mainpage()
    }
}
