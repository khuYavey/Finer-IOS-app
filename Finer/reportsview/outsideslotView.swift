//
//  outsideslotView.swift
//  Finer
//
//  Created by Коля Хамник on 15.05.2023.
//

import SwiftUI
struct reportoutside: View {
@Environment(\.showingSheet) var showingSheet
@StateObject var camera = CameraModel()

    var body: some View {
        ZStack{
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                Spacer()
                HStack{
                    if camera.isTaken{
                        Button(action: {
                            withAnimation(){
                                camera.reTake()}}, label: {
                                    Text("Перезняти")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                    
                                    
                                        .frame(width: 110,height: 45)
                                    
                                    
                                        .overlay(
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                    
                                    
                                        .background(Color.white) // If you have this
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .padding(25)
                                    
                                })
                        .padding(15)
                        .navigationBarItems(trailing:
                                                Button(action:{
                            sendMail(image: camera.getPic())
                            if !camera.isSaved{camera.savePic()}
                            self.showingSheet?.wrappedValue = false
                           
                            
                        }, label: {
                            Text("Надіслати")
                                .font(.system(size: 22, weight: .bold))
                            
                        })
                                            
                                            
                                            
                                            
                        )
                        
                        
                    }
                    
                    
                    else{
                        VStack{
                            Spacer()
                            Image(systemName: "car.2.fill")
                                .resizable()
                                .scaledToFit()//тут замінити на інше фото
                                .frame(width: 60, height: 90,alignment: .center)
                                .background(.clear)
                            Spacer()
                            Button(action: {withAnimation(.spring().delay(0.3)){camera.takePic()}}, label: {
                                ZStack{
                                    
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 90,alignment: .center)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                        .frame(width: 70, height: 100,alignment: .center)
                                }
                                .padding(20)
                                
                            })
                            
                            .onAppear(perform: {
                                camera.Check()
                            })
                            
                        }
                        
                        .navigationBarItems(trailing:
                                                Button("Скасувати") {
                            self.showingSheet?.wrappedValue = false
                        })
                    }
                    
                }}
                
            }
    }}
struct outsideslotView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                Spacer()
                
                    .navigationBarTitle(Text("Огляд").bold().font(.system(size: 50)), displayMode: .large)
                   
                }
                
                
                
                
                    .padding(15)
                Text("Щоб повідомити про порушення паркування, будь ласка, переконайтеся, що автомобіль неправильно припаркований на паркувальному місці, наприклад, займає два паркувальні місця або створює будь-які перешкоди. Після підтвердження натисніть відповідну кнопку та дотримуйтеся наданих інструкцій, щоб сфотографувати порушення.")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer(minLength: 40)
                Image(systemName: "car.side.and.exclamationmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 200,height: 200,alignment: .center)
                //схематичне зображення неправильно припаркованої машини
                Spacer(minLength: 100)
                NavigationLink(destination:reportoutside()){
                    Text("Порушення")
                    
                        .frame(width: 130,height: 40)
                        .overlay(
                            
                            
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    
                    
                        .background(Color.black) // If you have this
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    
                }.frame(alignment: .bottom)
                
            }
        }
    }
}

struct outsideslotView_Previews: PreviewProvider {
    static var previews: some View {
        outsideslotView()
    }
}
