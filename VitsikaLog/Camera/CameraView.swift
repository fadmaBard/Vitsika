//
//  CameraView.swift
//  VitsikaLog
//
//  Created by Isabelle Starcky on 09/02/2021.
//
import SwiftUI

struct CameraView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        
        ZStack {
            Color("roseVitsika")
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                Button("Camera") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
                Button("Album") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }.padding()
            }
            .navigationBarTitle("Camera")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

