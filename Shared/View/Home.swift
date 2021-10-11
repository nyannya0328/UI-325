//
//  Home.swift
//  UI-325 (iOS)
//
//  Created by nyannyan0328 on 2021/10/11.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var videos : [DynamicPlayer] = [
    
        DynamicPlayer(plyer: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4") ?? ""))),
        
        DynamicPlayer(plyer: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4") ?? ""))),
        
        
        DynamicPlayer(plyer: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4") ?? "")))
        
        
        
       
    
    
    ]
    var body: some View {
        NavigationView{
            
            
            VStack(spacing:15){
                
                
                ForEach(videos){video in
                    
                    VideoPlayerCardView(video: video)
                    
                    
                }
                
                
                
            }
            .padding()
            .navigationTitle("Dynamic Player")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
