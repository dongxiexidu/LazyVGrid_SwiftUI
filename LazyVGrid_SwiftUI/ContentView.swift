//
//  ContentView.swift
//  LazyVGrid_SwiftUI
//
//  Created by lidongxi on 2022/8/31.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MainGridContentViewModel()
    
    // spacing 垂直网格中的视图之间(水平方向)默认存在一个间距15
    // 定义的网格是多少列
//    let columns = [GridItem(.flexible(), spacing: 5),// 水平方向与next item 间距 5
//                   GridItem(.flexible(), spacing: 25), // 水平方向与next item 间距 25
//                   GridItem(.flexible(), spacing: 30)] // 水平方向与next item 间距 30, 因为水平方向没有next item 因此写space是无效的
   
//    let columns = [GridItem(.flexible()),
//                   GridItem(.flexible()),
//                   GridItem(.flexible())]
    
//    let columns = [GridItem(.fixed(120)),
//                   GridItem(.fixed(150)),
//                   GridItem(.fixed(180))]
//
    // .adaptive不指定具体几列,自适应
    let columns = [GridItem(.adaptive(minimum: 100, maximum: 120))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) { // spacing: 垂直方向间距, 默认值大约是8 ?
                    ForEach(MockData.avatars, id: \.id) { avatar in
                        AvatarView(avatar: avatar,
                                   width: .infinity,
                                   height: 90, font: .callout)
                        //.background(Color.gray)
                        .onTapGesture {
                            viewModel.selectedAvatar = avatar
                        }
                    }
                }
            }
            .navigationTitle(Text("🤺 Avatars"))
            .sheet(isPresented: $viewModel.isPresentingProfileView) {
                if let selected = viewModel.selectedAvatar {
                    AvatarProfileView(avatar: selected,
                                      isShowing: $viewModel.isPresentingProfileView)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
