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
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var profileImageView: CircleImageView!
    @IBOutlet private weak var profileUsernameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func setup(pullRequest: PullRequest) {
        nameLabel.text = pullRequest.title
        descriptionLabel.text = pullRequest.body
        profileUsernameLabel.text = pullRequest.user?.login
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let dateString = dateFormatter.string(from: pullRequest.createdAt!)
        dateLabel.text = dateString
        
        if let imageUrl = pullRequest.user?.avatarUrl {
            profileImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: #imageLiteral(resourceName: "ProfileMini"))
        } else {
            profileImageView.image = #imageLiteral(resourceName: "ProfileMini")
        }
    }
}
