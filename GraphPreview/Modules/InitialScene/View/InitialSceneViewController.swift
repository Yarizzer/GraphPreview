//
//  InitialSceneViewController.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

import UIKit

final class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
        (interactor as? BaseInteractable)?.lifeCycleDidChanged(event: .sceneDidLoad)
	}
	
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        (interactor as? BaseInteractable)?.lifeCycleDidChanged(event: .didEnterForeground)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        (interactor as? BaseInteractable)?.lifeCycleDidChanged(event: .didEnterBackground)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var sceneTitle: UILabel!
}

extension InitialSceneViewController: InitialSceneViewControllerType {
	func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            sceneTitle.alpha = Constants.alphaValues.min
        case .prepareForInitialAnimation:
            topPaddingConstraint.constant = AppUINode.shared.topPaddingValue + Constants.topExtraCV
        case .runInitialAnimation:
            UIView.animate(withDuration: Constants.initialAD, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: extractSelf { sSelf in
                sSelf.sceneTitle.alpha = Constants.alphaValues.max
                
                sSelf.topPaddingConstraint.constant -= Constants.topExtraCV
                
                sSelf.view.layoutIfNeeded()
            })
		}
	}
}

extension InitialSceneViewController {
	private struct Constants {
        static let alphaValues: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        
        //MARK: - ConstraintsValues
        static let topExtraCV: CGFloat = 30
        //Animation duration
        static let initialAD: Double = 10.0
	}
}
