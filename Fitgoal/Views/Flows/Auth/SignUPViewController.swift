//
//  SignUPViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 08.01.2021.
//

import UIKit

class SignUPViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let bottomLine =  CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: nameTF.frame.height - 1, width: nameTF.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        let bottomLine1 =  CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: nameTF.frame.height - 1, width: nameTF.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        let bottomLine2 =  CALayer()
        bottomLine2.frame = CGRect(x: 0.0, y: nameTF.frame.height - 1, width: nameTF.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        let bottomLine3 =  CALayer()
        bottomLine3.frame = CGRect(x: 0.0, y: nameTF.frame.height - 1, width: nameTF.frame.width, height: 1.0)
        bottomLine3.backgroundColor = UIColor.opaqueSeparator.cgColor
        
        nameTF.layer.addSublayer(bottomLine1)
        emailTF.layer.addSublayer(bottomLine2)
        passwordTF.layer.addSublayer(bottomLine3)
        confirmPassTF.layer.addSublayer(bottomLine)
        
        view.backgroundColor = .clear
    }
}
