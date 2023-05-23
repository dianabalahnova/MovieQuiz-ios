//
//  MovieQuizUITests2LaunchTests.swift
//  MovieQuizUITests2
//
//  Created by Диана on 23.05.2023.
//

import XCTest

final class MovieQuizUITests2LaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
