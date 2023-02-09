//
//  SplashViewController.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit

class SplashViewController: BaseViewControler {
    var viewModel: SplashViewModel
    var coordinator: SplashCoordinator?
    
    init(viewModel: SplashViewModel, coordinator: SplashCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }

    // MARK: - Config
    func config() {
        configViewModelInput()
        configViewModelOutput()
        configRoutingOutput()
    }

    func configViewModelInput() {

    }

    func configViewModelOutput() {
        
    }

    func configRoutingOutput() {
        self.viewModel.routing.routeToIntro
            .subscribe(onNext: {[unowned self] _ in
                self.coordinator?.routeToIntro()
            })
            .disposed(by: self.disposeBag)
    }
}
