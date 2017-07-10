//
//  RepositoryTableViewCell.swift
//  Concrete
//
//  Created by Rodrigo Dias on 07/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryTableViewCell: UITableViewCell {
    static let identifier = "RepositoryCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var profileImageView: CircleImageView!
    @IBOutlet private weak var profileUsernameLabel: UILabel!
    
    func setup(repository:Repository) {
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
        forksLabel.text = String(describing: repository.forksCount!)
        starsLabel.text = String(describing: repository.stargazersCount!)
        profileUsernameLabel.text = repository.owner?.login
        
        if let imageUrl = repository.owner?.avatarUrl {
            profileImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: #imageLiteral(resourceName: "ProfileBig"))
        } else {
            profileImageView.image = #imageLiteral(resourceName: "ProfileBig")
        }
    }
}
