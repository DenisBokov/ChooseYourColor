//
//  ChangeColorViewController.swift
//  ChooseYourColor
//
//  Created by Denis Bokov on 30.05.2024.
//

import UIKit

class ChangeColorViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    var colorViewChange: UIColor!
    var delegate: ChangeColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = colorViewChange
        
        setupSliders()
        setupTextLabel()
    }
    
    @IBAction func changeColorView() {
        setupTextLabel()
        setupColorView()
    }
    
    @IBAction func saveChangesButtonPrest() {
        delegate.setNewColor(for: colorView.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    private func setupSliders() {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        if colorViewChange.getRed(&r, green: &g, blue: &b, alpha: &a) {
                redSlider.setValue(Float(r), animated: true)
                greenSlider.setValue(Float(g), animated: true)
                blueSlider.setValue(Float(b), animated: true)
        }

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

