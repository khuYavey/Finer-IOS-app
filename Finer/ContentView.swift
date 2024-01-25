//
//  ContentView.swift
//  Finer
//
//  Created by Коля Хамник on 10.05.2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var tapped = false
    var body: some View {
        NavigationView{
            VStack {
                
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(tapped ? 0.4 : 1)
                    .offset(x:tapped ? 120 : -50 , y:tapped ? -270 :30 )
                
                //
                Text("FINER")
                    .font(.system(size: 50, weight: .semibold, design: .rounded))
                //                    .offset(x: 20, y: -100)
                    .scaleEffect(tapped ? 1.4 : 1)
                    .offset(x:tapped ? -90 : 40 , y:tapped ? -350 :-100 )
                if tapped {
                    Text("Це додаток, що працює завдяки спільноті і бореться з порушеннями правил дорожнього руху, починаючи з паркування, дозволяючи користувачам легко повідомляти про них за допомогою фотографій та скарг, відправлених владі.")
                    
                        .font(.system(size:25, weight: .semibold, design: .rounded))
                        .padding(.top, -300.0)
                }
                
                //                    Text(tapped ? "Start":"Next")}()
                
                
                
                
                if !tapped{
                    Button (action: {
                        withAnimation(.spring().speed(0.7))
                        {
                            tapped.toggle()}}
                            , label: {
                        Text("Далі")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                            .foregroundColor(.white)
                            .frame(width: 130,height: 50)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        
                            .background(Color.black) // If you have this
                            .cornerRadius(25)
                            
                    })
                    .padding(.top, -54.0)
                    .offset(x: 0, y: 90)
                }
                else{
                    NavigationLink {
                        VStack{
                            bar()
                                .navigationBarBackButtonHidden()
                        }
                    } label: {
                        Text("Запуск")
                        
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 130,height: 50)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                        
                            .background(Color.black) // If you have this
                            .cornerRadius(25)
                        
                    }.offset(x:0,y:52)}}
            
            
            .padding()
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
    
}

