//
//  SliderGridVC.swift
//  WeldDataTest
//
//  Created by trevor wilson on 2023-11-05.
//


import Foundation
import UIKit

class SliderGridViewController: UIViewController {
    
    let customTitleLabel = UILabel()
    
    private let ampsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 50
        slider.maximumValue = 350
        slider.addTarget(self, action: #selector(ampsSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private let voltsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 12
        slider.maximumValue = 37
        slider.addTarget(self, action: #selector(voltsSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private let distanceSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 50
        slider.maximumValue = 350
        slider.value = slider.minimumValue
        // Round increment to nearest 5
        slider.addTarget(self, action: #selector(distanceValueChanged), for: .valueChanged)
        return slider
    }()
    
    private let timeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 150
        slider.addTarget(self, action: #selector(timeSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    private let ampsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Amps"
        return label
    }()
    
    private let voltsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Volts"
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Distance"
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Time"
        return label
    }()
    
    private let output1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let output2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Set the Title
        
       // customTitleLabel.text = "Your Custom Title"
        customTitleLabel.font = UIFont.boldSystemFont(ofSize: 20) // Adjust the font and style as needed
        customTitleLabel.textColor = UIColor.black // Set the text color
        customTitleLabel.sizeToFit() // Adjust the size of the label based on its content
        customTitleLabel.center = CGPoint(x: self.view.frame.size.width / 2, y: 20) // Adjust the position as needed
        self.view.addSubview(customTitleLabel)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let sliderLabelPairs: [(UISlider, UILabel)] = [
            (ampsSlider, ampsLabel),
            (voltsSlider, voltsLabel),
            (distanceSlider, distanceLabel),
            (timeSlider, timeLabel)
        ]
        
        for (slider, label) in sliderLabelPairs {
            let containerStackView = UIStackView()
            containerStackView.axis = .vertical
            containerStackView.spacing = 10
            
            containerStackView.addArrangedSubview(label)
            containerStackView.addArrangedSubview(slider)
            
            stackView.addArrangedSubview(containerStackView)
            
            // Set slider constraints
            slider.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                slider.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
                slider.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
                slider.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        
        let outputsStackView = UIStackView(arrangedSubviews: [output1Label, output2Label])
        outputsStackView.axis = .horizontal
        outputsStackView.alignment = .center
        outputsStackView.spacing = 20
        
        stackView.addArrangedSubview(outputsStackView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    // Slider value changed handlers
    
    @objc private func ampsSliderValueChanged(sender: UISlider) {
        let increment: Float = 1 // Volt Increment Value
        let roundedValue = round(sender.value / increment) * increment
        sender.value = roundedValue
        let value = ampsSlider.value
        ampsLabel.text = "Amps: \(value)"
        
        // Recalculate outputs
        calculateAndDisplayOutputs()
    }
    
    @objc private func voltsSliderValueChanged(sender: UISlider) {
        let increment: Float = 0.5 // Volt Increment Value
        let roundedValue = round(sender.value / increment) * increment
        sender.value = roundedValue
        let value = voltsSlider.value
        voltsLabel.text = "Volts: \(value)"
        
        // Recalculate outputs
        calculateAndDisplayOutputs()
    }
    
    @objc private func distanceValueChanged(sender: UISlider) {
        let increment: Float = 5 // Desired increment value
        let roundedValue = round(sender.value / increment) * increment
        sender.value = roundedValue
        let value = distanceSlider.value
        distanceLabel.text = "Distance: \(value)"
        
        // Recalculate outputs
        calculateAndDisplayOutputs()
    }
    
    @objc private func timeSliderValueChanged(sender: UISlider) {
        let increment: Float = 1 // Volt Increment Value
        let roundedValue = round(sender.value / increment) * increment
        sender.value = roundedValue
        let value = timeSlider.value
        timeLabel.text = "Time: \(value)"
        
        // Recalculate outputs
        calculateAndDisplayOutputs()
    }
    
    private func calculateAndDisplayOutputs() {
        let amps = ampsSlider.value
        let volts = voltsSlider.value
        let distance = distanceSlider.value
        let time = timeSlider.value
        
        let output1 = String(format: "%.2f", (((amps * volts) * time) / distance) / 1000)
        output1Label.text = "Output1: \n \(output1)"
        
        let output2 = String(format: "%.0f", (distance / time) * 60)
        output2Label.text = "Output2: \n \(output2)"
    }
    
    
}

