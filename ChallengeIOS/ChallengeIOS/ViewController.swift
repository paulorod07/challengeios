//
//  ViewController.swift
//  ChallengeIOS
//
//  Created by Paulo Rodrigues on 03/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var loadingView: LoadingView?
    
    override func loadView() {
        loadingView = LoadingView(loadingName: .loadingSpinner)
        view = loadingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView?.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadingView?.stop()
        }
    }

}

