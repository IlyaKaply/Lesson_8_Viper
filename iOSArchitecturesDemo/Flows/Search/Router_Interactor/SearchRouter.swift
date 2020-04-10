 import Foundation
 import UIKit
 
 
 protocol SearchRouterInput {
    func openAppDetails(for app: ITunesApp)
    func openSongDetails(for song:ITunesSong)
    
    func openAppInITunes(_ song: ITunesApp)
    func openSongInITunes(_ song: ITunesSong)
 }
 
 final class SearchRouter:SearchRouterInput {
    
    weak var viewController:UIViewController?
    
    // Open Details
    func openAppDetails(for app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
    func openSongDetails(for song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
    
    //Open in ITunes
    func openAppInITunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl,
            let url = URL(string: urlString)
            else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openSongInITunes(_ song: ITunesSong) {
        guard let urlString = song.artistName,  //!!!!!!!!!!
            let url = URL(string: urlString)
            else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
 }
 
