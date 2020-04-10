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
        let presenter = SearchPresenter()
        let appViewController = AppSearchViewController(presenter: presenter)
        presenter.viewInput = appViewController
        
        return appViewController
    }
    
    static func buildSong() -> (UIViewController & SearchViewInput) {
        let presenter = SearchPresenter()
        let songViewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = songViewController
        
        return songViewController
    }
}
