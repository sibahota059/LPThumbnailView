//
//  LPThumbnailCounterView.swift
//  LPThumbnailView
//
//  Created by Luis Padron on 12/9/17.
//  Copyright © 2017 Luis Padron. All rights reserved.
//

import UIKit

/**
 LPThumbnailCounterView

 A circular view with a label, used inside of `LPThumbnailView`.
 */
internal class LPThumbnailCounterView: LPShadowView {
    // MARK: Override

    /// Overriden init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    /// Overriden init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    /// Makes sure to update the corner radius on any bound changes.
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
    }

    // MARK: Helpers

    /// Helper function to initialize the view
    internal override func initialize() {
        // Set shadow properties
        self.normalShadowRadius = 2
        self.normalShadowOpactiy = 0.4
        self.touchedShadowRadius = 1
        self.touchedShadowOpacity = 0.2
        self.setShadowTo(.normal, duration: 0.0)
        // Constraint setup
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = self.bounds.width / 2
        // Add constraints for label
        self.addSubview(counterLabel)
        self.counterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.counterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.counterLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.counterLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    // MARK: Subviews

    /// The label which will display a count of the images in `LPThumbnailView` 
    internal lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
}
