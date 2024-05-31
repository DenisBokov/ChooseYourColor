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
    
        setupTextLabel()
        setupColorView()
    }

    @IBAction func changeColorView() {
        setupTextLabel()
        setupColorView()
    }
    
    private func setupColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setupTextLabel() {
        redLabel.text = stringFormat(for: redSlider)
        greenLabel.text = stringFormat(for: greenSlider)
        blueLabel.text = stringFormat(for: blueSlider)
    }
    
    private func stringFormat(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

