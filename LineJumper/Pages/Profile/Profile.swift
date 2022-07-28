//
//  Profile.swift
//  LineJumper
//
//  Created by CoopStudent on 7/24/22.
//

import SwiftUI
import Kingfisher

struct Profile: View {
    
    @State var name = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var image = ""
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var showImagePicker = false
    @EnvironmentObject var viewModel: AuthViewModel;
    
    var body: some View {
        VStack{
            ZStack{
                Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                if viewModel.currentUser?.isCustomer != "true" {
                    DissmissArrow().offset(x: -130, y: -50)
                }
                
                Button{
                    showImagePicker = true
                }label: {
                    
                    if viewModel.currentUser?.photo == nil{
                        
                        VStack(alignment:.center){
                            if let companyImage = profileImage {
                                companyImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(100)
                                    .offset(y: 60)
                      
                                }
                            else {
                                                    Image("profilePic")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                        .cornerRadius(100)
                                                        .offset(y: 60)
                                }
                        }
                        
                    } else {
                        KFImage(URL(string: viewModel.currentUser!.photo!))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                            .offset(y: 60)
                    }
                    
                    
                }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                
                Text(viewModel.currentUser!.fullName).offset(y: 130)
                    .font(.title2)
         
            }
            
            VStack(alignment: .leading, spacing:10){
                Text("Your name").font(.subheadline)
                CustomInputField(image: "person", placeholder: "Full Name", text: $name).padding(.bottom, 10)
                Text("Your email").font(.subheadline)
                CustomInputField(image: "envelope", placeholder: "Full Name", text: $email)
                    .padding(.bottom, 10)
                Text("Your number").font(.subheadline)
                             CustomInputField(image: "phone", placeholder: "Full Name", text: $phoneNumber).padding(.bottom, 10)
            }.padding().padding(.top, 34)

            Button{
   
                viewModel.updatePhoto(selectedImage!)
                
            } label: {
                ManageButton(theText: "Save Changes", theColor: "primary").padding()
            }

            
            Spacer()
            
        }.navigationBarTitle("You can't see me 👀")
            .navigationBarHidden(true).ignoresSafeArea()
            .onAppear {
                name = viewModel.currentUser?.fullName ?? ""
                email = viewModel.currentUser?.email ?? ""
                phoneNumber = viewModel.currentUser?.phoneNumber ?? ""
                image = viewModel.currentUser?.photo ?? "false"
            }
    }
    
    func loadImage(){
          guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
      }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
