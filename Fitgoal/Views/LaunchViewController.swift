//
//  LaunchViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 05.01.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var actionIndicator: UIActivityIndicatorView!
    
    let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
