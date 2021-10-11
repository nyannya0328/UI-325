//
//  VideoPlayerCardView.swift
//  UI-325 (iOS)
//
//  Created by nyannyan0328 on 2021/10/11.
//

import SwiftUI
import AVFoundation

struct VideoPlayerCardView: View {
    var video : DynamicPlayer
    @State var isPlaying  = false
    var body: some View {
        ZStack{
            
            
        DynamicPlayerVideoCard(video: video)
                .frame(height: getVideoResolution(player: video.plyer))
            
            Button {
                if isPlaying{
                    
                    video.plyer.play()
                    
                    
                }
                else{
                    
                    video.plyer.pause()
                    
                    
                    
                    
                }
                
                isPlaying.toggle()
            } label: {
                
                
                
                Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .opacity(isPlaying ? 1 : 0)
            }

                
              
            
            
            
            
        }
        .cornerRadius(20)
    }
    
    func getVideoResolution(player : AVPlayer)->CGFloat{
        
        guard let tracks = player.currentItem?.asset as? AVURLAsset else{return 0}
        
        
        let width  = UIScreen.main.bounds.width - 30
       
        
        guard let track  = tracks.tracks(withMediaType: AVMediaType.video).first else{return 0}
        
        let size = track.naturalSize.applying(track.preferredTransform)
        
        let ration = size.width / size.height
        
        let newHeight = width / ration
        
        return newHeight
        
        
        
    }
}

struct VideoPlayerCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
