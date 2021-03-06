//
//  ViewController.swift
//  Nonograms
//
//  Created by Samantha Gatt on 6/10/20.
//  Copyright © 2020 Samantha Gatt. All rights reserved.
//

import UIKit
import Combine

final class PuzzleViewController: UIViewController {
    /// Set of all subscriptions. Each will be canceled on deallocation.
    private var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var puzzleView: PuzzleView!
    @IBOutlet weak var exButton: UIButton!
    @IBOutlet weak var fillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exButton.layer.borderColor = UIColor.label.cgColor
        exButton.layer.cornerRadius = 5
        fillButton.layer.borderColor = UIColor.label.cgColor
        fillButton.layer.borderWidth = 2
        fillButton.layer.cornerRadius = 5
        
        puzzleView.rules = PuzzleRules(
            rowRules: [[2, 1], [2], [2], [1], [2]],
            colRules: [[1, 1], [1, 1, 1], [3], [1], [1]]
        )
        // Subscribe to updates to see if puzzle has been solved
        puzzleView.puzzleValidity.sink { [weak self] isValid in
            guard let self = self else { return }
            if isValid {
                let alert = UIAlertController(title: "Yay!", message: "You solved the puzzle :)", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Okay", style: .default)
                alert.addAction(okayAction)
                self.present(alert, animated: true)
            }
        }.store(in: &subscriptions)
    }
    
    @IBAction func setExMode(_ sender: Any) {
        exButton.layer.borderWidth = 2
        fillButton.layer.borderWidth = 0
        puzzleView.fillMode = .ex
    }
    @IBAction func setFillMode(_ sender: Any) {
        fillButton.layer.borderWidth = 2
        exButton.layer.borderWidth = 0
        puzzleView.fillMode = .fill
    }
}
