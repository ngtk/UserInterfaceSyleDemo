//
//  AppearanceState.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UserNotifications
import UIKit

class AppearanceState {
    static var preferenceDidChange = Notification.Name("AppearanceState.PreferenceDidChange")
    static var userInterfaceStyleDidChange = Notification.Name("AppearanceState.UserInterfaceStyleDidChange")

    private var userInterfaceStyle = UIUserInterfaceStyle.light {
        didSet {
            if userInterfaceStyle != oldValue {
                NotificationCenter.default.post(
                    name: AppearanceState.userInterfaceStyleDidChange,
                    object: userInterfaceStyle
                )
            }
        }
    }

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handlePreferenceChange(_:)),
            name: AppearanceState.preferenceDidChange,
            object: self
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: AppearanceState.preferenceDidChange,
            object: self
        )
    }

    @objc func handlePreferenceChange(_ notification: Notification) {
        guard let newUserInterfaceStyle = notification.object as? UIUserInterfaceStyle else { return }
        userInterfaceStyle = newUserInterfaceStyle
    }
}
