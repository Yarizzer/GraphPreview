//
//  AppUINDeviceLayer.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import UIKit

final class AppUINDeviceLayer: AppUINDeviceLayerType {
    var screenSize: CGRect { UIScreen.main.bounds }
    var topPaddingValue: CGFloat {
        guard (UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0) > Constants.paddingValues.top.withoutNotch else { return Constants.paddingValues.top.withoutNotch }
            
        return Constants.paddingValues.top.withNotch
    }
    
    var bottomPaddingValue: CGFloat {
        guard (UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.bottom ?? 0) > Constants.paddingValues.bottom.withoutNotch else { return Constants.paddingValues.bottom.withoutNotch }
        
        return Constants.paddingValues.bottom.withNotch
    }
    
    func generateFeedback(with type: FeedbackType) {
        switch type {
        case .success:  UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .failure:  UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
    }
    
    func vibrate() { UIDevice.vibrate() }
}

extension AppUINDeviceLayer {
    private enum Constants {
        static let paddingValues = (top : (withNotch: 44.0, withoutNotch: 24.0),
                                    bottom : (withNotch: 34.0, withoutNotch: 0.0))
    }
}
