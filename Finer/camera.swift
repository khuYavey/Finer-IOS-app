//
//  camera.swift
//  Finer
//
//  Created by Коля Хамник on 16.05.2023.
//
import Foundation
import AVFoundation
import SwiftUI

import Combine
public var lolo : [UIImage] = []

//class ImageStore: ObservableObject {
//    static let shared = ImageStore()
//    @Published var images: [UIImage] = []
//
//    // Додайте методи для оновлення масиву зображень за потреби
//    // Наприклад, ви можете визначити функцію для додавання нового зображення
//    func addImage(_ image: UIImage) {
//        images.append(image)
//    }
//}
class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    @Published var isSaved = false
    @Published var picData = Data(count: 1)
    
    func Check() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUp() {
        do {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.session.stopRunning()
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        print("Знімок зроблено")
        
        guard let imageData = photo.fileDataRepresentation() else { return }
        self.picData = imageData
    }
    
    func getPic() -> Data? {
        let image = UIImage(data: self.picData)!
        let imageData = image.jpegData(compressionQuality: 1.0)
        return imageData

    }
    func savePic() {
        lolo.append(UIImage(data: self.picData)!)
        self.isSaved = true
    }
    
    func reTake() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                    self.isTaken = false
                }
            }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    @ObservedObject var camera : CameraModel
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return view
    }
}

