//
//  MainViewController.swift
//  ChooseYourColor
//
//  Created by Denis Bokov on 21.06.2024.
//

import UIKit

protocol ChangeColorViewControllerDelegate {
    func setNewColor(for color: UIColor)
}

class MainViewController: UIViewController {

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let changeColorVC = segue.destination as? ChangeColorViewController else { return }
        changeColorVC.colorViewChange = view.backgroundColor
        changeColorVC.delegate = self
    }
}

// MARK: - ChangeColorViewControllerDelegate
extension MainViewController: ChangeColorViewControllerDelegate {
    func setNewColor(for color: UIColor) {
        view.backgroundColor = color
    }
}


