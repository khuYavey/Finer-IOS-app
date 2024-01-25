//
//  bar.swift
//  Finer
//
//  Created by Коля Хамник on 12.05.2023.
//

import SwiftUI

struct bar: View {
    @State private var selected_index = 0
    var body: some View {
        
        
        TabView(selection: $selected_index){
            mainpage()
                .onTapGesture {
                    
                    self.selected_index = 0
                   
                }
                .tabItem{
                    Image(systemName: "house")}.tag(0)
            
            HistoryView()
                .onTapGesture {
                    self.selected_index = 1
                }
                .tabItem{
                    Image(systemName: "clock.arrow.circlepath")}.tag(1)
            NotificationView()
                .onTapGesture {
                    self.selected_index = 2
                }
                .tabItem{
                    Image(systemName: "bell")}.tag(2)
            
            
        }
    }
}



struct bar_Previews: PreviewProvider {
    static var previews: some View {
        bar()
    }
}
