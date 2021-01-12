//
//  LoginViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 08.01.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bottomLine =  CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: emailTF.frame.height - 1, width: emailTF.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        let bottomLine1 =  CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: emailTF.frame.height - 1, width: emailTF.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        emailTF.layer.addSublayer(bottomLine1)
        PasswordTF.layer.addSublayer(bottomLine)
        
        view.backgroundColor = .clear
    }
}
