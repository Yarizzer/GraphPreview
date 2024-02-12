//
//  InitialSceneRouter.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

import UIKit

protocol InitialSceneRoutable: AnyObject {
	static func assembly() -> UIViewController
	func routeTo(scene type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType)
}

final class InitialSceneRouter {
	private func prepareDestinationScene(with type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType) -> UIViewController {
        #warning("Fill routing here")
        
		switch type {
		case .testScene:    print("\(self) \(#function) msg: 'Test scene'")
		}
		
		return UIViewController()
	}
	
	private weak var view: InitialSceneViewController?
}

extension InitialSceneRouter: InitialSceneRoutable {
	static func assembly() -> UIViewController {
		let router = InitialSceneRouter()
		let vc                  = InitialSceneViewController(nibName: String(describing: InitialSceneViewController.self), bundle: Bundle.main)
		let viewModel           = InitialSceneViewModel()
		let presenterService    = InitialScenePresenterService(withModel: viewModel)
		let presenter           = InitialScenePresenter(for: vc, service: presenterService)
		let interactorService   = InitialSceneInteractorService(withModel: viewModel)
		let interactor          = InitialSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
		
        vc.interactor = interactor
		router.view = vc
		
		guard let view = router.view else {
			fatalError("cannot instantiate \(String(describing: InitialSceneViewController.self))")
		}
		
		return view
	}
	
	func routeTo(scene type: InitialSceneRoutableContractData.InitialSceneRoutableSceneType) {
		let vc = prepareDestinationScene(with: type)
        #warning("uncomment if need to implement custom scene transitioning")
//		vc.modalPresentationStyle = .currentContext
//		vc.transitioningDelegate = view
		self.view?.present(vc, animated: true)
	}
}
