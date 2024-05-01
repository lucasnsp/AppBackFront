//
//  ProfileView.swift
//  AppBackFront
//
//  Created by Adrian Iraizos Mendoza on 1/5/24.
//

import SwiftUI

struct ProfileView: View {
    let image: Image
    let profeileImage: Image
    let name: String
    let user: String
    let buttonText: String
    weak var delegate: ButtonDelegate?
    
    var body: some View {
        VStack {
            Image("nft")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            HStack {
                ZStack(alignment:.bottomTrailing) {
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay {
                            ZStack(alignment:.bottomTrailing) {
                                Circle()
                                    .stroke(Color.white,lineWidth: 2)
                                Image(systemName: "pencil")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .offset(y:15)
                            }
                        }
                }
                Spacer()
                VStack(alignment:.trailing) {
                    Text(name)
                        .font(.title)
                        .foregroundStyle(.white)
                    Text(user)
                        .font(.subheadline)
                        .foregroundStyle(Color("loginTitle"))
                }
            }
            .frame(height: 150)
            .padding(.horizontal)
            Button {
                delegate?.tappedExitAppButton()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color("loginTitle"),lineWidth: 2)
                    Text(buttonText)
                        .font(.title3)
                        .foregroundStyle(Color("loginTitle"))
                }
                .frame(height: 44)
                .padding()
            }
            .tint(.clear)
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("background"))
    }
}

#Preview {
    ProfileView(image: Image("nft"), profeileImage: Image("user"), name: "Lucas Neves", user: "@userProfile",buttonText: "Salir")
}

extension ProfileView {
    init(delegate: ButtonDelegate?) {
        image = Image("nft")
        profeileImage = Image("user")
        name = "Lucas Neves"
        user = "@userProfile"
        buttonText = "Salir"
        self.delegate = delegate
    }
}

protocol ButtonDelegate: AnyObject {
    func tappedExitAppButton()
}
