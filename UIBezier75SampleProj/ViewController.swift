//
//  ViewController.swift
//  UIBezier75SampleProj
//
//  Created by Rithik Vardhan on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIBezier75ActivityIndicator!
    @IBOutlet weak var loadingButton: UIBezier75LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingButton.animationStyle = .springIn
        loadingButton.alphaFadeValue = 0.7
        loadingButton.setCustomTitle("TAP HERE", for: .normal)
        activityIndicator.indicatorColor = .systemIndigo
    }


    @IBAction func loadingButtonTapped(_ sender: UIBezier75LoadingButton) {
//        loadingButton.startLoadingAnimation()
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.loadingButton.stopLoadingAnimation()
            self?.activityIndicator.stopAnimating()
//            self?.loadingButton.setTitle("TEST", for: .normal)
        }
    }
}

