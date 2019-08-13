//
//  UserInterfaceStyleChanging.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UIKit
import RxSwift

protocol UserInterfaceStyleChanging {
    var disposeBag: DisposeBag { get }

    func subscribeUserIntrafaceStyle()
    func userInterfaceStyleDidChange(_ userInterfaceStyle: UIUserInterfaceStyle)
}

extension UserInterfaceStyleChanging {
    func subscribeUserIntrafaceStyle() {
        AppAppearanceState.shared.userInterfaceStyle
            .subscribe(onNext: { style in self.userInterfaceStyleDidChange(style) })
            .disposed(by: disposeBag)
    }
}
