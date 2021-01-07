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
     
    var page = 0
    
    override func viewDidLayoutSubviews() {
            scrollWidth = scrollView.frame.size.width
            scrollHeight = scrollView.frame.size.height
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        self.toolBar.setBackgroundImage(UIImage(),
                                        forToolbarPosition: .any,
                                        barMetrics: .default)
        self.toolBar.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        let nextBtn = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: nil)
        let skipBtn = UIBarButtonItem(title: "SKIP", style: .plain, target: self, action: nil)
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
      
        toolBar.items = [skipBtn, spaceBtn, nextBtn]
        
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        var frame = CGRect(x: 0, y: -62, width: 0, height: 0)
        
        for index in 0..<textImgs.count {
            frame.origin.x = scrollWidth * CGFloat(index) + 20.5
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)
                 
            let textImages = UIImageView.init(image: UIImage.init(named: textImgs[index]))
            textImages.frame = CGRect(x:100,y:350,width:320,height:270)
            textImages.contentMode = .scaleAspectFit
            textImages.center = CGPoint(x:scrollWidth/2.2,y: scrollHeight - 310)

            slide.addSubview(textImages)
            scrollView.addSubview(slide)
            
            nextBtn.tag = index + 1
            
        }
        
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(textImgs.count), height: scrollHeight)
        
        self.scrollView.contentSize.height = 1.0

        pageControl.numberOfPages = textImgs.count
        pageControl.currentPage = 0
        
    }
    
    @IBAction func pageChanged(_ sender: Any) {
            scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            setIndiactorAndImageForCurrentPage()
        }

    func setIndiactorAndImageForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
            pageControl?.currentPage = Int(page)
            
        imageView.image = UIImage(named: imgs[Int(page)])
        }
    
    @IBAction func nextButtonClicked(_ : UIBarButtonItem?){
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * CGFloat(), y: 0), animated: true)
    }
}
