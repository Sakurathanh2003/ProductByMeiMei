//
//  SplashCoordinator.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit

struct SplashFinishEvent: CoordinatorEvent {
}

final class SplashCoordinator: Coordinator {
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    lazy var controller: SplashViewController = {
        let viewModel = SplashViewModel()
        let controller = SplashViewController(viewModel: viewModel, coordinator: self)
        return controller
    }()

    override func start() {
        super.start()

        self.window.rootViewController = self.controller
        self.window.makeKeyAndVisible()
    }

    func routeToIntro() {
        self.send(event: SplashFinishEvent())
    }

    override func stop(completion: (() -> Void)? = nil) {
        if self.window.rootViewController == self {
            self.window.rootViewController = nil
        }

        super.stop(completion: completion)
    }
}
