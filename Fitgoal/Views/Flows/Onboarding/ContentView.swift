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
    
    private let nibName = "ContentView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func commonInit(){
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(self.view)
    }
    
    func updateLables(extrasText: String, descriptionText: String) {
        extrasLable.text = extrasText
        descriptionLable.text = descriptionText
    }
}
