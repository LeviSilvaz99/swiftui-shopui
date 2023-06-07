//
//  ContentView.swift
//  ShopUi
//
//  Created by André Levi Oliveira Silva on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 1
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0 ..< onboardItems.count, id: \.self) { i in
                    Text(onboardItems[i].tag)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(onboardItems[i].color)
                    .cornerRadius(8)
                    .opacity(i == index ? 1 : 0)
                    .scaleEffect(i == index ? 1 : 0)
                    .animation(.easeInOut, value: i == index)
                }
            }
            
            TabView(selection: $index) {
                ForEach(0 ..< 3) { i in
                    Image("Image_\(i)")
                        .resizable()
                        .padding()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack (spacing: 4) {
                ForEach(0 ..< 3) { i in
                    Color("purpleColor")
                        .opacity(i == index ? 1 : 0.5)
                        .frame(width: i == index ? 8 : 16, height: 8)
                        .animation(.easeInOut(duration: 0.4), value: i == index)
                }
            }
            
            ZStack {
                ForEach(0 ..< 3) { i in
                    VStack {
                        Text(onboardItems[i].title)
                            .font(.largeTitle)
                        
                        Text(onboardItems[i].description)
                            .foregroundColor(Color("textColor"))
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                            .padding(.bottom)
                        
                    }
                    .opacity(i == index ? 1 : 0)
                    .offset(CGSize(width: 0, height: i == index ? 0 : 100))
                    .animation(.easeInOut, value: i == index)
                }
            }
            
            Button {
                
            } label: {
                Text("Get started")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .foregroundColor(.white)
                    .background(Color("purpleColor"))
                    .cornerRadius(12)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
