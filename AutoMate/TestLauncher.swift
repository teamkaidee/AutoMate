//
//  TestLauncher.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

public struct TestLauncher {

    // MARK: Properties
    var options: LaunchOptionsSet

    // MARK: Initializers
    public init(options: [LaunchOption]) {
        self.options = LaunchOptionsSet(options)
    }

    // MARK: Public methods
    public func configure(application: XCUIApplication) -> XCUIApplication {
        application.launchArguments += buildLaunchArguments()
        application.launchEnvironment.unionInPlace(buildLaunchEnvironment())
        return application
    }

    // MARK: Build methods
    /**
     Builds launch arguments.

     - returns: List of launch arguments.
     */
    func buildLaunchArguments() -> [String] {
        return options.flatMap { $0.launchArguments }.reduce([], combine: +)
    }

    /**
     Builds launch environments.

     - returns: Dictionary of launch environments
     */
    func buildLaunchEnvironment() -> [String: String] {
        return options.flatMap { $0.launchEnvironments }.reduce([:]) { $0.union($1) }
    }
}
