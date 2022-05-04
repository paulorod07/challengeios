//
//  LoadingView.swift
//  ChallengeIOS
//
//  Created by Paulo Rodrigues on 03/05/22.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    enum LoadingStatus {
        case stopped
        case running
    }
    
    enum LoadingName {
        case loadingSpinner
        
        var key: String {
            switch self {
            case .loadingSpinner:
                return "loading-spinner"
            }
        }
    }
    
    private var animationView: AnimationView?
    
    static let sharedInstance = LoadingView(loadingName: .loadingSpinner)
    
    private var loadingStatus: LoadingStatus = .stopped
    
    private var loadingName: LoadingName?
    
    init(loadingName:LoadingName? = .loadingSpinner) {
        let frame = CGRect.zero
        super.init(frame: frame)
        self.loadingName = loadingName
        setupLottieAnimation()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View setup
    
    private func setupLottieAnimation() {
        guard let _loadingName = loadingName else { return }

        animationView = .init(name: _loadingName.key)
        
        animationView?.frame = bounds
    
        animationView?.backgroundColor = backgroundColor
        
        animationView?.contentMode = .scaleAspectFit
        
        animationView?.loopMode = .loop
        
        animationView?.animationSpeed = 0.5
        
        guard let _animationView = animationView else { return }
        
        addSubview(_animationView)
        
        _animationView.play()
    }
    
    private func removeLoadingView() {
        UIView.animate(withDuration: 0.4) {
            self.alpha = 0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
    
    func start() {
        loadingStatus = .running
        setupLottieAnimation()
    }
    
    func stop() {
        loadingStatus = .stopped
        removeLoadingView()
    }
    
    private func setupConstraints() {
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        
        animationView?
            .centerXAnchor
            .constraint(equalTo: centerXAnchor).isActive = true
        
        animationView?
            .centerYAnchor
            .constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
