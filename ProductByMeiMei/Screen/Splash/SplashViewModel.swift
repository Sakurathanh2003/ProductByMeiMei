//
//  SplashViewModel.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit
import RxSwift

struct SplashViewModelInput: InputOutputViewModel {

}

struct SplashViewModelOutput: InputOutputViewModel {

}

struct SplashViewModelRouting: RoutingOutput {
    fileprivate(set) var routeToIntro = PublishSubject<Void>()
}

final class SplashViewModel: BaseViewModel<SplashViewModelInput, SplashViewModelOutput, SplashViewModelRouting> {
    
    override init() {
        super.init()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.routing.routeToIntro.onNext(Void())
        }
    }
}
