//
//  BaseViewController.swift
//  Concrete
//
//  Created by Rodrigo Dias on 09/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func alertWebError(handler: @escaping (() -> Swift.Void)) {
        let title = NSLocalizedString("errorWebTitle", comment: String())
        let message = NSLocalizedString("errorWebMessage", comment: String())
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: NSLocalizedString("errorWebButton", comment: String()), style: .default) { (UIAlertAction) in
            handler()
        }
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
