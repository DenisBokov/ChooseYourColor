//
//  ViewController.swift
//  ChooseYourColor
//
//  Created by Denis Bokov on 30.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        colorView.layer.borderWidth = 5
        colorView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupTextLabel()
        chageColorView()
    }

    @IBAction func changeColorView() {
        setupTextLabel()
        chageColorView()
    }
    
    private func chageColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func setupTextLabel() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

