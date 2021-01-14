//
//  ContentView.swift
//  Fitgoal
//
//  Created by Igor Chebotar on 13.01.2021.
//

import UIKit

final class ContentView: UIView {
    
    @IBOutlet private var titleLable: UILabel!
    @IBOutlet private var extrasLable: UILabel!
    @IBOutlet private var descriptionLable: UILabel!
    @IBOutlet var containerView: UIView!
    
    
    private let nibName = "ContentView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    private func commonInit(){
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
    }
    
    func updateLables(extrasText: String, descriptionText: String) {
        extrasLable.text = extrasText
        descriptionLable.text = descriptionText
    }
}
