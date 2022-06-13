//
//  VideoTab.swift
//  YouTock
//
//  Created by Francesco Maria Moneta on 6/12/22.
//

import SwiftUI
import YouTubePlayerKit


struct VideoTab: View {
    static var alwaysSunnyPlaylist: String = "PLujArFFV96Gr46rC2mUnHsDhl48KtMrbA"
    static var verticalMusicPlaylist: String = "PLcu5dHLQm-CKrAnvw6m7aw0xV56053TwZ"
    @AppStorage("onboarding") var isOnContentView: Bool = true
    let youTubePlayer: YouTubePlayer = YouTubePlayer(source: .playlist(id: verticalMusicPlaylist), configuration: .init(
        autoPlay: true,
        showControls: false,
        showFullscreenButton: false,
        showAnnotations: false,
        showRelatedVideos: false)
    )
    
    
    var body: some View {
        YouTubePlayerView(self.youTubePlayer) { state in
            // Overlay ViewBuilder closure to place an overlay View
            // for the current `YouTubePlayer.State`
            switch state {
            case .idle:
                ProgressView()
            case .ready:
                EmptyView()
            case .error( _):
                Text(verbatim: "YouTube player could not be loaded")
            }
        }
        .gesture(
            DragGesture()
                .onEnded({gesture in
                    if gesture.translation.height < -25
                    {
                        youTubePlayer.nextVideo()
                    }
                    else if gesture.translation.height > 25
                    {
                        youTubePlayer.previousVideo();
                    }
                    else if gesture.translation.width > 25
                    {
                        isOnContentView = false;
                    }
                })
        )
    }
}

struct VideoTab_Previews: PreviewProvider {
    static var previews: some View {
        VideoTab()
    }
}
