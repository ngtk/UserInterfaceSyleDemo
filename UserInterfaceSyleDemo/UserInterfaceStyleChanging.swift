//
//  UserInterfaceStyleChanging.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UIKit

protocol UserInterfaceStyleChanging {
    func subscribeUserIntrafaceStyle()
    func unsubscribeUserInterfaceStyle()
    func userInterfaceStyleDidChange(_ userInterfaceStyle: UIUserInterfaceStyle)
}

extension UserInterfaceStyleChanging {
    func subscribeUserIntrafaceStyle() {
        NotificationCenter.default.addObserver(
            forName: AppAppearanceState.userInterfaceStyleDidChange,
            object: nil,
            queue: nil,
            using: { self.handleUserInterfaceStyle($0) }
        )

    }

    func unsubscribeUserInterfaceStyle() {
        NotificationCenter.default.removeObserver(
            self,
            name: AppAppearanceState.userInterfaceStyleDidChange,
            object: self
        )
    }

    func handleUserInterfaceStyle(_ notification: Notification) {
        guard let userInterfaceStyle = notification.object as? UIUserInterfaceStyle else { return }
        userInterfaceStyleDidChange(userInterfaceStyle)
    }
}
