//
//  ViewController.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UserInterfaceStyleChanging {
    var appApearanceState: AppAppearanceState
    let disposeBag = DisposeBag()
    var button = UIButton()

    init(appAppearanceState: AppAppearanceState) {
        self.appApearanceState = appAppearanceState
        super.init(nibName: nil, bundle: nil)

        subscribeUserIntrafaceStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Button
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)

        // View
        view.addSubview(button)
        view.backgroundColor = .white

        // Constraint
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    func userInterfaceStyleDidChange(_ userInterfaceStyle: UIUserInterfaceStyle) {
        // Update color here.
        switch userInterfaceStyle {
        case .light, .unspecified:
            view.backgroundColor = .white
        case .dark:
            view.backgroundColor = .gray
        }
    }

    @objc func handleButtonTap(_ object: Any) {
        show(SecondViewController(), sender: self)
    }

    // Update user interface style in the root view controller.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            appApearanceState.updateSystemUserInterfaceStyle(traitCollection.userInterfaceStyle)
        }
    }
}
