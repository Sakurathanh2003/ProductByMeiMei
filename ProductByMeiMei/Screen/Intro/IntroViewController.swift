//
//  IntroViewController.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit
import RxSwift
import RxCocoa

class IntroViewController: BaseViewControler {
    
    @IBOutlet weak var introCollectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var viewModel: IntroViewModel
    var coordinator: IntroCoordinator?
    init(viewModel: IntroViewModel, coordinator: IntroCoordinator) {
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
        skipButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .bind(to: viewModel.input.nextPress)
            .disposed(by: self.disposeBag)
        
        nextButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .bind(to: viewModel.input.skipPress)
            .disposed(by: self.disposeBag)
    }

    func configViewModelOutput() {
        
    }

    func configRoutingOutput() {

    }
    
    func configCollectionView() {
        
    }
}
