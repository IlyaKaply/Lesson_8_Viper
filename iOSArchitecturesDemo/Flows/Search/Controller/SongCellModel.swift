

//
//  SongCellMOdel.swift
//  iOSArchitecturesDemo
//
//  Created by Илья on 04.04.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let title: String
    let subtitle: String?
    let ratingLabel: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                             subtitle: model.artistName,
                             ratingLabel: model.collectionName)
    }
}

