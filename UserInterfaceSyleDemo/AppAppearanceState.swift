//
//  AppearanceState.swift
//  UserInterfaceSyleDemo
//
//  Created by Kento Nagata on 2019/08/13.
//  Copyright © 2019 ngtk. All rights reserved.
//

import UserNotifications
import UIKit
import RxSwift

class AppAppearanceState {
    static let shared = AppAppearanceState()

    private let userInterfaceStyleSubject = BehaviorSubject<UIUserInterfaceStyle>(value: .light)
    lazy var userInterfaceStyle: Observable<UIUserInterfaceStyle> = userInterfaceStyleSubject.asObservable()

    func updateSystemUserInterfaceStyle(_ userInterfaceStyle: UIUserInterfaceStyle) {
        userInterfaceStyleSubject.onNext(userInterfaceStyle)
    }
}
