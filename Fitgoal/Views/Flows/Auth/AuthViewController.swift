//
//  AuthViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 07.01.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var createAccountBtn: UIButton!
    
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var textImg: UIImageView!
    
    @IBOutlet weak var orLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    var count = 0
    var signUpView: UIView!
    var loginView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.createAccountBtn.layer.cornerRadius = 25
        
        avatarImg.image = UIImage(named: "brandLogoIconColor")
        titleImg.image = UIImage(named: "titleHello")
        textImg.image = UIImage(named: "descriptionHello")
        
        signUpView = SignUPViewController().view
        loginView = LoginViewController().view
    }
    
    func openWizardScreen() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WizardViewController") as! WizardViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true)
    }
    
    func prepareLoginView() {
        view.addSubview(loginView)
        signUpView.removeFromSuperview()
        orLable.isHidden = false
        facebookBtn.isHidden = false
        googleBtn.isHidden = false
        twitterBtn.isHidden = false
        textImg.isHidden = true
        titleImg.image = UIImage(named: "titleLogin")
        avatarImg.image = UIImage(named: "brandLogoIconColor")
        createAccountBtn.frame = CGRect(x: 20, y: 556, width: 374, height: 50)
        titleImg.frame = CGRect(x: 120, y: 250, width: 174, height: 53)
        createAccountBtn.setTitle("Login", for: .normal)
        questionLable.text = "Don't have an account?"
        loginBtn.setTitle("Signup", for: .normal)
    }
    
    func prepareSignUpView() {
        view.addSubview(signUpView)
        orLable.isHidden = true
        facebookBtn.isHidden = true
        googleBtn.isHidden = true
        twitterBtn.isHidden = true
        titleImg.image = UIImage(named: "titleSignup")
        avatarImg.image = UIImage(named: "avatarIconUser")
        textImg.isHidden = true
        titleImg.frame = CGRect(x: 120, y: 250, width: 174, height: 53)
        createAccountBtn.frame = CGRect(x: 20, y: 700, width: 374, height: 50)
    }
    
    @IBAction func switchToSignUp(_ sender: UIButton) {
        if count == 0 {
            prepareSignUpView()
        } else {
            if count == 1 {
                prepareLoginView()
            } else {
                loginView.removeFromSuperview()
                openWizardScreen()
            }
        }
        count += 1
    }
    
    @IBAction func switchToLoginOrSignup(_ sender: Any) {
        if count < 2 {
            prepareLoginView()
        } else {
            loginView.removeFromSuperview()
            prepareSignUpView()
        }
    }
    
    @IBAction func facebookSignUp(_ sender: UIButton) {
        openWizardScreen()
    }
    
    @IBAction func googleSignUp(_ sender: UIButton) {
        openWizardScreen()
    }
    
    @IBAction func twitterSignUP(_ sender: UIButton) {
        openWizardScreen()
    }
}
