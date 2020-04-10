//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Elena Gracheva on 26.03.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDescriptionView: UIView {

// MARK: - Subviews

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()


    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 10
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .lightGray
         label.font = UIFont.systemFont(ofSize: 14.0)
         return label
     }()
    
    private(set) lazy var dateLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .lightGray
         label.font = UIFont.systemFont(ofSize: 14.0)
         return label
     }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.setupLayout()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           self.setupLayout()
       }
       
       // MARK: - UI
       
    private func setupLayout() {
            self.addSubview(self.titleLabel)
            self.addSubview(self.descriptionLabel)
            self.addSubview(self.versionLabel)
            self.addSubview(self.dateLabel)
            
           NSLayoutConstraint.activate([
                       self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
                       self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
                       self.titleLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
                       
                       self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
                       self.versionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
                       self.versionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),
                       
                       self.dateLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 3.0),
                       self.dateLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
                       self.dateLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0),

                       self.descriptionLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 12.0),
                       self.descriptionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
                       self.descriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0)
               
           ])
       }
}
