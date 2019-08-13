//
//  SecondViewController.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController, UserInterfaceStyleChanging {
    let disposeBag = DisposeBag()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        subscribeUserIntrafaceStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
