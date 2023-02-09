//
//  IntroViewModel.swift
//  ProductByMeiMei
//
//  Created by Thanh Vu on 09/02/2023.
//

import UIKit
import RxSwift

struct IntroViewModelInput: InputOutputViewModel {
    let nextPress = PublishSubject<()>()
    let skipPress = PublishSubject<()>()
}

struct IntroViewModelOutput: InputOutputViewModel {

}

struct IntroViewModelRouting: RoutingOutput {

}

final class IntroViewModel: BaseViewModel<IntroViewModelInput, IntroViewModelOutput, IntroViewModelRouting> {

}
