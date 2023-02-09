//
//  AppCoordinator.swift
//  DemoCleanArchitectMvvm
//
//  Created by Thanh Vu on 08/02/2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private var window: UIWindow
    private var splashCoordinator: SplashCoordinator?

    init(window: UIWindow) {
        self.window = window
        super.init()
        self.routeToSplash()
    }

    override func handle(event: CoordinatorEvent) -> Bool {
        if event is SplashFinishEvent {
            if let splashCoordinator {
                self.removeChild(splashCoordinator)
                self.splashCoordinator?.stop()
                self.splashCoordinator = nil
            }

            self.routeToIntro()
        }

        return false
    }

    // MARK: - Routing
    func routeToSplash() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        splashCoordinator.start()
        self.addChild(splashCoordinator)
        self.splashCoordinator = splashCoordinator
    }

    func routeToIntro() {
        if let splashCoordinator {
            splashCoordinator.stop()
            self.splashCoordinator = nil
        }

        let introCoordinator = IntroCoordinator(window: self.window)
        introCoordinator.start()
        self.addChild(introCoordinator)
    }
}
