//
//  DynamicPlayerVideoCard.swift
//  UI-325 (iOS)
//
//  Created by nyannyan0328 on 2021/10/11.
//

import SwiftUI
import AVKit

struct DynamicPlayerVideoCard: UIViewControllerRepresentable {
    var video : DynamicPlayer
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
        
    }
    
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let view = AVPlayerViewController()
        view.player = video.plyer
        view.showsPlaybackControls = false
        view.view.backgroundColor = .clear
        view.videoGravity = .resizeAspectFill
        video.plyer.actionAtItemEnd  = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayBack), name: .AVPlayerItemDidPlayToEndTime, object: video.plyer.currentItem)
        
        
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject{
        var parent : DynamicPlayerVideoCard
        
        init(parent : DynamicPlayerVideoCard) {
            self.parent = parent
        }
        
        
        @objc func restartPlayBack(){
            
            parent.video.plyer.seek(to: .zero)
            
            
    
        }
        
    }
    
    
}

