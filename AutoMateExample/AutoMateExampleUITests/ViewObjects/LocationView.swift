//
//  LocationView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - LocationView
open class LocationView: BaseAppView, PushedView {

    // MARK: Elements
    open var deniedPermissionLabel: XCUIElement {
        return view.staticTexts[Locators.denied]
    }
}

// MARK: - Locators
private extension LocationView {

    enum Locators: String, Locator {
        case permissionLabel
        case denied = "Denied"
    }
}