//
//  IntoductionViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 05.01.2021.
//

import UIKit
import SnapKit

class IntoductionViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    let topSpacer: UIView = UIView()
    let botoomSpacer: UIView = UIView()
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var imgs = [ "lifeImage", "styleImage", "healthImage"]
    var extrasText = ["Your life", "Your style", "Your health"]
    var descriptionsText = ["Create your own fitness Routine where ever you are.", "Control your own fitness Routine where ever you are.", "Feel better like never before start today."]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        let contentStackView = UIStackView()
        contentStackView.axis = .horizontal
        contentStackView.alignment = .fill
        contentStackView.distribution = .fillEqually
        
        for index in 0..<descriptionsText.count{
            let contentView = ContentView.fromNib()
            
            contentView.updateLables(extrasText: extrasText[index], descriptionText: descriptionsText[index])
            
            contentStackView.addArrangedSubview(contentView)
        }
//
        scrollView.addSubview(contentStackView)
//        topSpacer.backgroundColor = .yellow
//        botoomSpacer.backgroundColor = .brown
//        containerView.addSubview(botoomSpacer)
//        containerView.addSubview(topSpacer)
//        containerView.addSubview(contentStackView)
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = descriptionsText.count
        pageControl.currentPage = 0
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
//            topSpacer.leftAnchor.constraint(equalTo: containerView.leftAnchor),
//            topSpacer.rightAnchor.constraint(equalTo: containerView.rightAnchor),
////            topSpacer.heightAnchor.constraint(equalTo: botoomSpacer.heightAnchor),
////            topSpacer.widthAnchor.constraint(equalTo: botoomSpacer.widthAnchor),
//            topSpacer.topAnchor.constraint(equalTo: containerView.topAnchor),
//            topSpacer.bottomAnchor.constraint(equalTo: botoomSpacer.topAnchor),

//            botoomSpacer.heightAnchor.constraint(equalTo: topSpacer.heightAnchor),
//
//            botoomSpacer.leftAnchor.constraint(equalTo: containerView.leftAnchor),
//            botoomSpacer.rightAnchor.constraint(equalTo: containerView.rightAnchor),
////            botoomSpacer.topAnchor.constraint(equalTo: topSpacer.bottomAnchor),
//            botoomSpacer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            contentStackView.heightAnchor.constraint(equalToConstant: 270),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: CGFloat(descriptionsText.count)),
            contentStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 32),
            contentStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 32),
//            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
//            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 673),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func nextButtonTap(_ sender: UIButton) {
        
        let x = scrollView.contentOffset.x
        let page = (x)/scrollWidth
        print(page)
        guard page < 2 else {
            let authVC = storyboard?.instantiateViewController(withIdentifier: "AuthVC") as! AuthViewController
            
            authVC.modalPresentationStyle = .fullScreen
            authVC.modalTransitionStyle = .crossDissolve
            self.present(authVC, animated: true)
            return
        }
        scrollView.setContentOffset(CGPoint(x: x + scrollWidth , y: 0), animated: true)
        pageControl.currentPage = Int(page) + 1
        imageView.image = UIImage(named: imgs[Int(page) + 1])
    }
    
    @IBAction func skipButtonTap(_ sender: UIButton) {
        let authVC = storyboard?.instantiateViewController(withIdentifier: "AuthVC") as! AuthViewController
        
        authVC.modalPresentationStyle = .fullScreen
        authVC.modalTransitionStyle = .crossDissolve
        self.present(authVC, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorAndImageForCurrentPage()
    }
    
    func setIndiactorAndImageForCurrentPage()  {
        let page = (scrollView.contentOffset.x)/scrollWidth
        pageControl.currentPage = Int(page)
        imageView.image = UIImage(named: imgs[Int(page)])
    }
}
