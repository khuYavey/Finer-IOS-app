//
//  NotificationView.swift
//  Finer
//
//  Created by Коля Хамник on 12.05.2023.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                
                Spacer()
                Text("Наразі немає сповіщень")
                    .navigationTitle("Сповіщення")
                    .multilineTextAlignment(.center)
                    .offset(y:203)}
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
