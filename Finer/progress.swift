import SwiftUI



struct progressView: View {
    @State private var isShowingPopup = false
    @State private var succes = false
    func start(){
        isShowingPopup = true
    }
    var body: some View {
        VStack {

        }
        .overlay(
            PopupView(isPresented: $isShowingPopup, succes: $succes)
                .zIndex(isShowingPopup ? 1 : -1)
        )
    }
}
struct PopupView: View {
@Binding var isPresented: Bool
//@State var some: () = progressView().start()
@Binding var succes: Bool
    var body: some View {

        if isPresented {
            ZStack {
                HStack{
                    Text("Запит надіслано")

                        .font(.system(size: 22))
                        .padding()
                        .opacity(0.6)


                        .padding()
                    Image(systemName: "checkmark")

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
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    withAnimation(.spring().delay(3)){
                        isPresented = false
//                        succes = true
                    }}
            }
        }
//        if succes{
//            ZStack {
//                HStack{
//                    Text("Request sent")
//                        .font(.system(size: 22))
//                        .padding()
//                        .opacity(0.6)
//
//                    Image(systemName: "checkmark")
//                }
//                HStack {
//                    Text("")
//                }
//                .frame(width: 250, height: 80)
//                .background(Color.gray)
//                .opacity(0.15)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//            }.onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    withAnimation(.spring()){
//                        succes = false
//                    }}
//            }
//
//
//        }
    }
}

struct progressView_Previews: PreviewProvider {
    static var previews: some View {
        progressView()
    }
}
