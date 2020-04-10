//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Elena Gracheva on 26.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit


final class SearchModuleBuilder {
    
    static func buildApp() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let appViewController = AppSearchViewController(presenter: presenter)
        
        presenter.viewInput = appViewController
        router.viewController = appViewController
        
        return appViewController
    }
    
    static func buildSong() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let songViewController = SongSearchViewController(presenter: presenter)
        
        presenter.viewInput = songViewController
        router.viewController = songViewController
        
        return songViewController
    }
}
