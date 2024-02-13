//
//  AppUINStyleLayer.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import UIKit

final class AppUINStyleLayer {
    //MARK: - Palette
    private enum AppPalette {
        case clear
        case white
        case black
        case extraLightGray
        case lightGray
        case gray
        case darkGray
        case extraDarkGray
        case lightRed
        case red
        case green
        case lightBlue
        case blue
        case lightPurple
        case purple
        
        var color: UIColor {
            switch self {
            case .clear:            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            case .black:            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .extraDarkGray:    return #colorLiteral(red: 0.07843137255, green: 0.07843137255, blue: 0.07843137255, alpha: 1)        // hex: 141414
            case .darkGray:         return #colorLiteral(red: 0.2941176471, green: 0.2941176471, blue: 0.2941176471, alpha: 1)        // hex: 4B4B4B
            case .gray:             return #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)        // hex: 828282
            case .lightGray:        return #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)        // hex: CDCDCD
            case .extraLightGray:   return #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)        // hex: E1E1E1
            case .white:            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            case .lightRed:         return #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3921568627, alpha: 1)        // hex: FF6464
            case .red:              return #colorLiteral(red: 1, green: 0.1960784314, blue: 0, alpha: 1)        // hex: FF3200
            case .green:            return #colorLiteral(red: 0, green: 0.6666666667, blue: 0.2745098039, alpha: 1)        // hex: 00AA46
            case .lightBlue:        return #colorLiteral(red: 0.1960784314, green: 0.7058823529, blue: 0.9686274529, alpha: 1)        // hex: 32B4F7
            case .blue:             return #colorLiteral(red: 0, green: 0.2, blue: 0.9411764706, alpha: 1)        // hex: 287DF0
            case .lightPurple:      return #colorLiteral(red: 0.6666666667, green: 0.5882352941, blue: 1, alpha: 1)        // hex: 8C96FF
            case .purple:           return #colorLiteral(red: 0.3921568627, green: 0, blue: 1, alpha: 1)        // hex: 6400FF
            }
        }
    }
    
    private enum StyleColors {
        //Theme based
        case firstLayer
        case secondLayer
        case thirdLayer
        case header
        case title
        case subtitle
        //Static colors
        case clear
        case lightRed
        case red
        case green
        case lightBlue
        case blue
        case lightPurple
        case purple
        
        var color: UIColor {
            let theme = UIScreen.main.traitCollection.userInterfaceStyle
            
            switch self {
            //Theme based
            case .firstLayer:
                switch theme {
                case .dark:     return AppPalette.black.color
                default:        return AppPalette.white.color
                }
            case .secondLayer:
                switch theme {
                case .dark:     return AppPalette.extraDarkGray.color
                default:        return AppPalette.extraLightGray.color
                }
            case .thirdLayer:
                switch theme {
                case .dark:     return AppPalette.darkGray.color
                default:        return AppPalette.lightGray.color
                }
            case .header:
                switch theme {
                case .dark:     return AppPalette.lightGray.color
                default:        return AppPalette.darkGray.color
                }
            case .title:
                switch theme {
                case .dark:     return AppPalette.lightGray.color
                default:        return AppPalette.darkGray.color
                }
            case .subtitle:     return AppPalette.gray.color
            //Static colors
            case .clear:            return AppPalette.clear.color
            case .lightRed:         return AppPalette.lightRed.color
            case .red:              return AppPalette.red.color
            case .green:            return AppPalette.green.color
            case .lightBlue:        return AppPalette.lightBlue.color
            case .blue:             return AppPalette.blue.color
            case .lightPurple:      return AppPalette.lightPurple.color
            case .purple:           return AppPalette.purple.color
            }
        }
    }
}

extension AppUINStyleLayer: AppUINStyleLayerType {
    //Theme
    var currentTheme: UIUserInterfaceStyle { UIScreen.main.traitCollection.userInterfaceStyle }
    //Theme based
    var colorFirstLayer: UIColor { StyleColors.firstLayer.color }
    var colorSecondLayer: UIColor { StyleColors.secondLayer.color }
    var colorThirdLayer: UIColor { StyleColors.thirdLayer.color }
    var colorHeader: UIColor { StyleColors.header.color }
    var colorTitle: UIColor { StyleColors.title.color }
    var colorSubtitle: UIColor { StyleColors.subtitle.color }
    //Static colors
    var colorClear: UIColor { StyleColors.clear.color }
    var colorLightRed: UIColor { StyleColors.lightRed.color }
    var colorRed: UIColor { StyleColors.red.color }
    var colorGreen: UIColor { StyleColors.green.color }
    var colorLightBlue: UIColor { StyleColors.lightBlue.color }
    var colorBlue: UIColor { StyleColors.blue.color }
    var colorLightPurple: UIColor { StyleColors.lightPurple.color }
    var colorPurple: UIColor { StyleColors.purple.color }
    //Fonts
    func font(for type: AppUINStyleLayerFontType, with style: UIFont.TextStyle) -> UIFont {
        switch type {
        case .appTitle:                 return UIFontMetrics(forTextStyle: style).scaledFont(for: Constants.appTitleFont)
        case .sceneTitle:               return UIFontMetrics(forTextStyle: style).scaledFont(for: Constants.sceneTitleFont)
        case .uiItemTitle:              return UIFontMetrics(forTextStyle: style).scaledFont(for: Constants.uiItemTitleFont)
        case .uiItemDescription:        return UIFontMetrics(forTextStyle: style).scaledFont(for: Constants.uiElementDescriptionFont)
        case .buttonTitle:              return UIFontMetrics(forTextStyle: style).scaledFont(for: Constants.buttonTitleFont)
        }
    }
    //Layers
    var layerBorderWidthWide: CGFloat { Constants.layerBorderWidthValues.wide }
    var layerBorderWidthRegular: CGFloat { Constants.layerBorderWidthValues.regular }
    var layerBorderWidthNarrow: CGFloat { Constants.layerBorderWidthValues.narrow }
    
    var layerLineWidthWide: CGFloat { Constants.layerLineWidthValues.wide }
    var layerLineWidthRegular: CGFloat { Constants.layerLineWidthValues.regular }
    var layerLineWidthNarrow: CGFloat { Constants.layerLineWidthValues.narrow }
    var layerLineWidthExtraNarrow: CGFloat { Constants.layerLineWidthValues.extraNarrow }
    //ImageNames
    var logoImageName: String { Constants.logoImageName }
}

extension AppUINStyleLayer {
    private enum Constants {
        static let appTitleFont: UIFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 30.0) ?? UIFont.systemFont(ofSize: 30.0)
        static let sceneTitleFont: UIFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        static let uiItemTitleFont: UIFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        static let uiElementDescriptionFont: UIFont = UIFont(name: "AppleSDGothicNeo-Light", size: 15.0) ?? UIFont.systemFont(ofSize: 15.0)
        static let buttonTitleFont: UIFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 17.0) ?? UIFont.systemFont(ofSize: 17.0)
        
        static let layerData: (borderWidth: CGFloat, lineWidth: CGFloat) = (borderWidth: 1.0, lineWidth: 1.2)
        
        static let layerBorderWidthValues: (wide: CGFloat, regular: CGFloat, narrow: CGFloat) = (wide: 2.0, regular: 1.5, narrow: 1.0)
        static let layerLineWidthValues: (wide: CGFloat, regular: CGFloat, narrow: CGFloat, extraNarrow: CGFloat) = (wide: 3.0, regular: 2.0, narrow: 1.2, extraNarrow: 0.5)
        static let logoImageName = "regularLogo"
    }
}
