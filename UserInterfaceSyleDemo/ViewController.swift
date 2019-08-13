//
//  ViewController.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var appApearanceState: AppAppearanceState

    init(appAppearanceState: AppAppearanceState) {
        self.appApearanceState = appAppearanceState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // Update user interface style in the root view controller.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)


        if traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            appApearanceState.updateSystemUserInterfaceStyle(traitCollection.userInterfaceStyle)
        }
    }
}

