//
//  HistoryView.swift
//  Finer
//
//  Created by Коля Хамник on 12.05.2023.
//

import SwiftUI

struct HistoryView: View {
//    @State private var items: [UIImage] = [UIImage(named: "po.jpeg")!, UIImage(named: "lo.jpeg")!]
    @State private var items: [UIImage] = []
//    @ObservedObject var imageStore = ImageStore()
    
    let formatter: DateFormatter = {
            let formatter = DateFormatter()
        formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                   ForEach(items, id: \.self){ image in
                        Group{
                            VStack{
                                HStack(alignment: .top){
                                    
                                    
                                    Text(formatter.string(from: Date()))
                                        .padding(.top,20)


                                }
                                .padding(3)
                                HStack{

                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)

                                        .foregroundColor(.yellow)

                                    VStack{
                                        Text("Ваш запит обробляється")
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }


                                }
                                Image(uiImage: image)
                      
                                    .resizable()
                                    .scaledToFit()
                                    
                                    .cornerRadius(10)
                                    .padding(.bottom,20)


                            }
                            .frame(minWidth: 360, maxWidth: 320, minHeight: 250, maxHeight: 300)
                            


                            .overlay(

                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray)
                                    .opacity(0.1)

                                    .cornerRadius(10)
                            )



                        }.padding(10)
                        
                   }
                    
                    Group{
                        VStack{
                            HStack(alignment: .top){
                                Text("10 листопада 2023 року, 10:30")
                                    .padding(.top,20)


                            }
                            .padding(3)
                            HStack{

                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)

                                    .foregroundColor(.green)

                                VStack{
                                    Text("Ваш запит було підтверджено")
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                }


                            }
                            Image("carpark")
                                .resizable()
                                .frame(minWidth: 250, maxWidth: 250, minHeight: 120, maxHeight: 150)
                                .cornerRadius(10)
                                .padding(.bottom,20)
                                .navigationTitle("Історія")
                            


                        }
                        .frame(minWidth: 360, maxWidth: 320, minHeight: 250, maxHeight: 300)


                        .overlay(

                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                                .opacity(0.1)

                                .cornerRadius(10)
                        )



                    }
                    
                }
            }
            .refreshable(action:{
                await refreshData()
            })
        }
        
    }
    func refreshData() async {
        do{
            // Simulate fetching new data with a delay
            try await Task.sleep(nanoseconds: 2_000_000_000)
            // Update the items array with new data
            items = lolo
            
        }catch {
            print("Помилка виникла під час оновлення даних")
        }
        
        
    }
}
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

