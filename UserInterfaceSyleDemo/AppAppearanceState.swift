//
//  AppearanceState.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UserNotifications
import UIKit

class AppAppearanceState {
    static var userInterfaceStyleDidChange = Notification.Name("AppAppearanceState.UserInterfaceStyleDidChange")

    private var userInterfaceStyle = UIUserInterfaceStyle.light {
        didSet {
            if userInterfaceStyle != oldValue {
                // Broadcast here.
                NotificationCenter.default.post(
                    name: AppAppearanceState.userInterfaceStyleDidChange,
                    object: userInterfaceStyle
                )
            }
        }
    }

    func updateSystemUserInterfaceStyle(_ userInterfaceStyle: UIUserInterfaceStyle) {
        self.userInterfaceStyle = userInterfaceStyle
    }
}
