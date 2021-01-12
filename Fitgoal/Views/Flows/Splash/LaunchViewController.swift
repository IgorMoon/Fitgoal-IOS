//
//  LaunchViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 05.01.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var actionIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var background: UIImageView!
    
    let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.sizeToFit()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "IntoductionVC") as! IntoductionViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        var runCount = 0

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount += 1

            if runCount == 3 {
                timer.invalidate()
                self.present(vc, animated: true)
            }
        }
    }
}
