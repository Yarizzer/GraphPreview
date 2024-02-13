//
//  AppUINDeviceLayerContract.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import Foundation

enum FeedbackType {
    case success, failure
}

protocol AppUINDeviceLayerType: AnyObject {
    var screenSize: CGRect { get }
    var topPaddingValue: CGFloat { get }
    var bottomPaddingValue: CGFloat { get }
    
    func generateFeedback(with type: FeedbackType)
    func vibrate()
}
