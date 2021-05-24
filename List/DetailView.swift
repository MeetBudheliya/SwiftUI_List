//
//  DetailView.swift
//  List
//
//  Created by Adsum MAC 1 on 24/05/21.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var EmpDetail = fillDetail(Name: "MB", Des: .ios, Mob: "564654564", profile: .ios)
    var body: some View {
        
        NavigationView{
            VStack(alignment: .center, spacing: 50, content: {
                Image(EmpDetail.profileImage)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(alignment: .center, spacing: 10){
                    Text(EmpDetail.name)
                        .bold()
                    Text(EmpDetail.designation.rawValue)
                    Text(EmpDetail.mobile)
                        .fontWeight(.light)
                }
                
            })
            .animation(.linear)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .foregroundColor(Color.init(color.violet.rawValue))
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            }))
            .onAppear(perform: {
               print(EmpDetail)
               UINavigationBar.appearance().barTintColor = .white
           })
        }
        .background(Color.red)
        .navigationBarHidden(true)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
