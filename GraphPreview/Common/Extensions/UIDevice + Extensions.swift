//
//  UIDevice + Extensions.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import UIKit
import AVFoundation

extension UIDevice {
    static func vibrate() { AudioServicesPlayAlertSound(kSystemSoundID_Vibrate) }
}
