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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var profileImageView: CircleImageView!
    @IBOutlet weak var profileUsernameLabel: UILabel!
    
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
