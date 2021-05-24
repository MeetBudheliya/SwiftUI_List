//
//  ContentView.swift
//  List
//
//  Created by Adsum MAC 1 on 24/05/21.
//

import SwiftUI

struct ContentView: View{

    @State var navigate = false
    @State var nextViewContent = fillDetail(Name: "", Des: .none, Mob: "", profile: .none)
    
    var data = [fillDetail(Name: "Meet Budheliya", Des: .ios , Mob: "9874563210", profile: .ios),
                fillDetail(Name: "Shubham Ramani", Des:.ios, Mob: "9874563210", profile: .ios),
                fillDetail(Name: "Nitin Paladiya", Des: .flutter, Mob: "78787856587", profile: .flutter),
                fillDetail(Name: "Dipes Korat", Des: .android, Mob: "875745788", profile: .android),
                fillDetail(Name: "Meet Sutariya", Des: .php, Mob: "757585785", profile: .php),
                fillDetail(Name: "Gunjan Vekariya", Des: .flutter, Mob: "785785787878", profile: .flutter),
                fillDetail(Name: "Chinatan Khunt", Des: .designer, Mob: "7578548787", profile: .designer),
                fillDetail(Name: "Dharmesh Kanjiriya", Des: .android, Mob: "9685747854", profile: .android),
                fillDetail(Name: "Nikunj Dhanani", Des: .fronted, Mob: "65545646456", profile: .fronted),
                fillDetail(Name: "Mayur Bakaraniya", Des: .ios, Mob: "6857567586", profile: .ios),
                fillDetail(Name: "Maharshi Suhagiya", Des: .php, Mob: "9854756214", profile: .php)]
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: true, content: {
                VStack(alignment: .leading, spacing: 0){
                    ForEach(0..<data.count){ i in
                        
                        HStack(alignment: .center, spacing: 15){
                            Image(data[i].profileImage)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .shadow(color: .black, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading, spacing: 5){
                                Text(data[i].name)
                                    .bold()
                                    .font(.body)
                                    .shadow(color: .black, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.white)
                                Text(data[i].designation.rawValue)
                                    .italic()
                                    .shadow(color: .black, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.white)
                                Text(data[i].mobile)
                                    .fontWeight(.light)
                                    .shadow(color: .black, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding()
                        .onTapGesture(perform: {
                            print("\(i) Row Selected")
                            nextViewContent = data[i]
                           navigate = true
                        })
                        NavigationLink(
                         destination: DetailView(EmpDetail: nextViewContent),
                         isActive: $navigate,
                         label: {
                         })
                      
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: .none, alignment: .leading)
            })
            .navigationTitle("Employees")
            .navigationBarTitleDisplayMode(.automatic)
            .background(Color.init(color.violet.rawValue))
        }
        .onAppear(perform: {
            print("Appear Navigation View")
            UINavigationBar.appearance().backgroundColor = UIColor(named: color.violet.rawValue)
        })
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct fillDetail{
    var name:String
    var designation:department
    var mobile:String
    var profileImage:String
    var id = UUID().uuidString
    init(Name:String,Des:department,Mob:String,profile:avatars) {
        name = Name
        designation = Des
        mobile = Mob
        profileImage = profile.rawValue
    }
}

enum department: String, CaseIterable {
    case ios = "iOS Developer"
    case android = "Android Developer"
    case php = "PHP Developer"
    case flutter = "Flutter Developer"
    case fronted = "Fronted Developer"
    case designer = "UI/UX Designer"
    case none = ""
}

enum avatars:String,CaseIterable {
    case ios = "iOS"
    case android = "Android"
    case php = "PHP"
    case flutter = "Flutter"
    case fronted = "Fronted"
    case designer = "Designer"
    case none = ""
}

enum color:String,CaseIterable{
    case violet = "Violet"
    case gray = "GrayC"
}

