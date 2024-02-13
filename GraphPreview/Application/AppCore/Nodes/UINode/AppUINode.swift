//
//  AppUINode.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import UIKit

final class AppUINode {
    static let shared = AppUINode()
    
    private init() {
        self.styleL = AppUINStyleLayer()
        self.deviceL = AppUINDeviceLayer()
    }
    
    private let deviceL: AppUINDeviceLayerType
    private let styleL: AppUINStyleLayerType
}

extension AppUINode: AppUINodeType {
    //MARK: - Device
    var screenSize: CGRect { deviceL.screenSize }
    var topPaddingValue: CGFloat { deviceL.topPaddingValue }
    var bottomPaddingValue: CGFloat { deviceL.bottomPaddingValue }
    //MARK: - Style
    //Theme
    var currentTheme: UIUserInterfaceStyle { styleL.currentTheme }
    //Theme based colors
    var colorFirstLayer: UIColor { styleL.colorFirstLayer }
    var colorSecondLayer: UIColor { styleL.colorSecondLayer }
    var colorThirdLayer: UIColor { styleL.colorThirdLayer }
    var colorHeader: UIColor { styleL.colorHeader }
    var colorTitle: UIColor { styleL.colorTitle }
    var colorSubtitle: UIColor { styleL.colorSubtitle }
    //Static colors
    var colorClear: UIColor { styleL.colorClear }
    var colorLightRed: UIColor { styleL.colorLightRed }
    var colorRed: UIColor { styleL.colorRed }
    var colorGreen: UIColor { styleL.colorGreen }
    var colorLightBlue: UIColor { styleL.colorLightBlue }
    var colorBlue: UIColor { styleL.colorBlue }
    var colorLightPurple: UIColor { styleL.colorLightPurple }
    var colorPurple: UIColor { styleL.colorPurple }
    //Fonts
    func font(for type: AppUINStyleLayerFontType, with style: UIFont.TextStyle) -> UIFont { styleL.font(for: type, with: style) }
    //Layers
    var layerBorderWidthWide: CGFloat { styleL.layerBorderWidthWide }
    var layerBorderWidthRegular: CGFloat { styleL.layerBorderWidthRegular }
    var layerBorderWidthNarrow: CGFloat { styleL.layerBorderWidthNarrow }
    var layerLineWidthWide: CGFloat { styleL.layerLineWidthWide }
    var layerLineWidthRegular: CGFloat { styleL.layerLineWidthRegular }
    var layerLineWidthNarrow: CGFloat { styleL.layerLineWidthNarrow }
    var layerLineWidthExtraNarrow: CGFloat { styleL.layerLineWidthExtraNarrow }
    //ImageNames
    var logoImageName: String { styleL.logoImageName }
    
    func invoke(sessionUID: UUID?, type: AppUINodeActionType) {
        guard sessionUID == sessionUID else {
            writeLog(type: .error, message: "Session uid is invalid")
            return
        }
        
        switch type {
        case .uinGenerateFeedback(let feedbackType):    deviceL.generateFeedback(with: feedbackType)
        case .uinVibrate:                               deviceL.vibrate()
        }
    }
}
