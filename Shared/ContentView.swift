//
//  ContentView.swift
//  Shared
//
//  Created by Hing Tat Tsang on 15/5/2022.
//

import SwiftUI
import WebKit
import URLImage

struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ContentView: View {
    @ObservedObject var datas = ReadData8()
    var body: some View {
        NavigationView {
            List {
//                Section {
//                    ContentView8()
//                }
                NavigationLink(destination: ContentView1().navigationTitle("九龍")) {
                    VStack(alignment: .leading) {
                        Text("九龍")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView2().navigationTitle("香港島")) {
                    VStack(alignment: .leading) {
                        Text("香港島")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView3().navigationTitle("荃灣")) {
                    VStack(alignment: .leading) {
                        Text("荃灣")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView4().navigationTitle("屯門及天水圍")) {
                    VStack(alignment: .leading) {
                        Text("屯門及天水圍")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView5().navigationTitle("大埔，北區及元朗")) {
                    VStack(alignment: .leading) {
                        Text("大埔，北區及元朗")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView6().navigationTitle("沙田及馬鞍山")) {
                    VStack(alignment: .leading) {
                        Text("沙田及馬鞍山")
                            .font(.title2)
                    }
                }
                NavigationLink(destination: ContentView7().navigationTitle("大嶼山")) {
                    VStack(alignment: .leading) {
                        Text("大嶼山")
                            .font(.title2)
                    }
                }
                Section {
                    NavigationLink(destination: AboutView().navigationTitle("關於")) {
                        VStack(alignment: .leading) {
                            Text("關於")
                                .font(.title2)
                        }
                    }
                }
            }
            .navigationTitle("交通情況快拍圖像")
            
        }
        .navigationViewStyle(.stack)
        
    }
}
struct AboutView: View {
    var body: some View {
        List {
            Text("影像來源：香港運輸署")
            Text("版本：1.1.1")
        }
        
    }
}

struct ContentView1: View {
    @ObservedObject var datas = ReadData()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}


struct ContentView2: View {
    @ObservedObject var datas = ReadData2()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView3: View {
    @ObservedObject var datas = ReadData3()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView4: View {
    @ObservedObject var datas = ReadData4()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}


struct ContentView5: View {
    @ObservedObject var datas = ReadData5()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView6: View {
    @ObservedObject var datas = ReadData6()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView7: View {
    @ObservedObject var datas = ReadData7()
    var body: some View {
        List(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView8: View {
    @ObservedObject var datas = ReadData8()
    var body: some View {
        ForEach(datas.users){ user in
            NavigationLink(destination: PhotoView(url: user.url, name: user.name)){
                VStack(alignment: .leading) {
                    
                    Text(user.name)
                        .font(.title2)
                    
                }
                
            }
            
            
        }
        
    }
}



struct PhotoView: View {
    var url: URL
    var name: String
    var body: some View {
        URLImage(url) {
                       // This view is displayed before download starts
                       EmptyView()
                   } inProgress: { progress in
                       // Display progress
                       Text("Loading...")
                   } failure: { error, retry in
                       // Display error and retry button
                       VStack {
                           Text(error.localizedDescription)
                       }
                   } content: { image in
                       // Downloaded image
                       image
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                   }
        .navigationTitle(name)
    }
}


//decode json
struct User: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}

///
struct User2: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData2: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata2", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
struct User3: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData3: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata3", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
struct User4: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData4: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata4", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
struct User5: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData5: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata5", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
struct User6: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData6: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata6", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
struct User7: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    var id = UUID()
    var name: String
    var url: URL
}

class ReadData7: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata7", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
class ReadData8: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata8", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
    
}
///
//end decode json
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

