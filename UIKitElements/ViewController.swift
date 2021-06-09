//
//  ViewController.swift
//  UIKitElements
//
//  Created by Александр Биктеев on 08.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideAllElements: UISwitch!
    @IBOutlet var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup main label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Setup segment contol
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setup slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
        
        //Setup datePicker
        datePicker.locale = Locale(identifier: "ru_RU")
        //datePicker.locale = Locale.current
        hideAllElements.onTintColor = .red
        switchLabel.text = "Скрыть все элементы?"
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .purple
        default: break
        }
    }
    @IBAction func sliderAction() {
        let backgraundColor = view.backgroundColor
        view.backgroundColor = backgraundColor?.withAlphaComponent(CGFloat(slider.value))
        mainLabel.text = String(slider.value)
    }
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format", message: "Enter your name")
            print ("Wrong format")
        } else {
            mainLabel.text = inputText
            textField.text = nil
        }
    }
    @IBAction func changeDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_RU")
        let dateValue = dateFormater.string(from: datePicker.date)
        mainLabel.text = dateValue
    }
    @IBAction func switchAction() {
        segmentedControl.isHidden.toggle()
        mainLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        doneButton.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        switchLabel.text = hideAllElements.isOn ? "Скрыть все элементы" : "Отобразить все элементы"
    }
    
    
}

extension ViewController {
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
