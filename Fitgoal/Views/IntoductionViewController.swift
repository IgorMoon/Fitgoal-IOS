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
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var imageView: UIImageView!

    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var imgs = ["lifeImage", "styleImage", "healthImage"]
    var textImgs = ["LifeText", "StyleText", "HealthText"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
//        configureScrollView()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        scrollView.delegate = self
        
        self.toolBar.setBackgroundImage(UIImage(),
                                        forToolbarPosition: .any,
                                        barMetrics: .default)
        self.toolBar.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        let nextButton = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: #selector(nextButtonClicked(_:)))
        let skipButton = UIBarButtonItem(title: "SKIP", style: .plain, target: self, action: nil)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        self.toolBar.items = [skipButton, spaceButton, nextButton]
        
        for index in 0..<textImgs.count{
            let pageView = UIView(frame: CGRect(x: CGFloat(index) * (scrollWidth), y: 0, width: scrollWidth, height: scrollHeight))
            scrollView.addSubview(pageView)
            
            //text images
            let textImage = UIImageView.init(image: UIImage.init(named: textImgs[index]))
            textImage.frame = CGRect(x:100,y:350,width:320,height:270)
            textImage.contentMode = .scaleAspectFit
            textImage.center = CGPoint(x:scrollWidth/2.2,y: scrollHeight - 310)
            pageView.addSubview(textImage)
        }
        
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(textImgs.count), height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        self.scrollView.contentSize.height = 1.0
            
        pageControl.numberOfPages = textImgs.count
        pageControl.currentPage = 0
        
        }
    
    @objc func nextButtonClicked(_ button: UIBarButtonItem){
        
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorAndImageForCurrentPage()
    }
    
    func setIndiactorAndImageForCurrentPage()  {
        let page = (scrollView.contentOffset.x)/scrollWidth
        pageControl.currentPage = Int(page)
        imageView.image = UIImage(named: imgs[Int(page)])
        }
}
