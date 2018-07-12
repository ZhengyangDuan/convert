//
//  CustomCell.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-12.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var customMessage : String?
    var customImage : UIImage?
    
    var customMessageView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    var customImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(customImageView)
        self.addSubview(customMessageView)
        
        customImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        customImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        customImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        customMessageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customMessageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        customMessageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        customMessageView.leftAnchor.constraint(equalTo: self.customImageView.rightAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = customMessage{
            customMessageView.text = message
        }
        if let image = customImage{
            customImageView.image = image
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
