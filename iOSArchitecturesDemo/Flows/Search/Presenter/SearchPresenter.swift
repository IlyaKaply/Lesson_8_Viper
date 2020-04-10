//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Elena Gracheva on 26.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    
    var searchAppResult: [ITunesApp] { get set }
    
    var searchSongResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
    
}

protocol SearchViewOutput: class {
    
    func viewDidSearchApp(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
    
    func viewDidSearchSong(with query: String)
    
    func viewDidSelectSong(_ app: ITunesSong)
}

class SearchPresenter {
    
    //    private let searchService = ITunesSearchService()
    
    var viewInput: (UIViewController & SearchViewInput)?
    
    let interactor:SearchInteractorInput
    let router:SearchRouterInput
    
    init(interactor:SearchInteractorInput, router:SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self]  results in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            results
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchAppResult = apps
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
            
        }
    }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self]  results in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            results
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchSongResults = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
    private func openSongDetails(with song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        self.viewInput?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}

extension SearchPresenter: SearchViewOutput {
    
    func viewDidSearchApp(with query: String) {
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openAppDetails(for: app)
    }
    
    func viewDidSearchSong(with query: String) {
        self.requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openSongDetails(for: song)
    }
}
