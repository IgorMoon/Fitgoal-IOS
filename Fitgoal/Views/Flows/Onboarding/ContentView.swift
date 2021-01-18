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
    
    func updateLables(extrasText: String, descriptionText: String) {
        extrasLable.text = extrasText
        descriptionLable.text = descriptionText
    }
}

extension UIView {
    class func fromNib() -> Self {
        return Bundle(for: Self.self).loadNibNamed(String(describing: Self.self), owner: nil, options: nil)![0] as! Self
    }
}
