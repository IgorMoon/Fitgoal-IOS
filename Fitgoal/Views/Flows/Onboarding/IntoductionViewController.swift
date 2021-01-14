//
//  IntoductionViewController.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 05.01.2021.
//

import UIKit

class IntoductionViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var contentViewdelegate: ContentView?
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var extrasText = ["lifeImage", "styleImage", "healthImage"]
    var descriptionsText = ["LifeText", "StyleText", "HealthText"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        scrollView.delegate = self
        
        for index in 0..<descriptionsText.count{
            let pageView = UIView(frame: CGRect(x: CGFloat(index) * (scrollWidth), y: 0, width: scrollWidth, height: scrollHeight))
            scrollView.addSubview(pageView)
            
            let contentView = ContentView(frame: CGRect(x: 32, y: 360, width: 272, height: 270))
            
            contentView.updateLables(extrasText: extrasText[index], descriptionText: descriptionsText[index])
            
            pageView.addSubview(contentView)
        }
        
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(descriptionsText.count), height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        self.scrollView.contentSize.height = 1.0
        
        pageControl.numberOfPages = descriptionsText.count
        pageControl.currentPage = 0
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
        imageView.image = UIImage(named: extrasText[Int(page) + 1])
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
        imageView.image = UIImage(named: extrasText[Int(page)])
    }
}
