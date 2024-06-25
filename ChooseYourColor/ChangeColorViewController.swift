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
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    var colorViewChange: UIColor!
    var delegate: ChangeColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = colorViewChange
        
        redColorTextField.delegate = self
        greenColorTextField.delegate = self
        blueColorTextField.delegate = self
        
        setupSliders()
        setupTextLabel()
        setupTextFields()
        
        addToolBar(for: redColorTextField, greenColorTextField, blueColorTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func changeColorView() {
        setupTextLabel()
        setupColorView()
        setupTextFields()
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
    
    private func setupTextFields() {
        redColorTextField.text = stringFormat(for: redSlider)
        greenColorTextField.text = stringFormat(for: greenSlider)
        blueColorTextField.text = stringFormat(for: blueSlider)
    }
    
    private func stringFormat(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func numberFormat(for textField: UITextField) {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        if let number = formatter.number(from: textField.text ?? "0.1") {
            redSlider.value = number.floatValue
        }
    }
}

// MARK - UITextFieldDelegate
extension ChangeColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newColorValue = textField.text else { return }
        
        if textField == redColorTextField {
            redSlider.setValue(Float(newColorValue) ?? 0.5, animated: true)
        } else if textField == greenColorTextField {
            greenSlider.setValue(Float(newColorValue) ?? 0.0, animated: true)
        } else {
            blueSlider.setValue(Float(newColorValue) ?? 0.0, animated: true)
        }

        setupColorView()
        setupTextLabel()
        numberFormat(for: redColorTextField)
    }
}

extension ChangeColorViewController {
    func addToolBar(for textFields: UITextField...) {
        let toolBar = UIToolbar(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: 100
        ))
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        textFields.forEach { textField in
            textField.inputAccessoryView = toolBar
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
