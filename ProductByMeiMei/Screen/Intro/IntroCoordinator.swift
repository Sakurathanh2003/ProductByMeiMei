//
//  IntroCoordinator.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit

final class IntroCoordinator: Coordinator {
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    lazy var controller: IntroViewController = {
        let viewModel = IntroViewModel()
        let controller = IntroViewController(viewModel: viewModel, coordinator: self)
        return controller
    }()

    override func start() {
        super.start()

        self.window.rootViewController = self.controller
        self.window.makeKeyAndVisible()
    }

    override func stop(completion: (() -> Void)? = nil) {
        super.stop(completion: completion)
    }
}
