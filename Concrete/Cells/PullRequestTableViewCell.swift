//
//  PullRequestTableViewCell.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit
import SDWebImage

class PullRequestTableViewCell: UITableViewCell {
    static let identifier = "RepositoryCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: CircleImageView!
    @IBOutlet weak var profileUsernameLabel: UILabel!
    
    func setup(pullRequest: PullRequest) {
        nameLabel.text = pullRequest.title
        descriptionLabel.text = pullRequest.body
        profileUsernameLabel.text = pullRequest.user?.login
        
        if let imageUrl = pullRequest.user?.avatarUrl {
            profileImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: #imageLiteral(resourceName: "ProfileMini"))
        } else {
            profileImageView.image = #imageLiteral(resourceName: "ProfileMini")
        }
    }
}
