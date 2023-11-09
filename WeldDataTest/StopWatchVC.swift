//
//  StopWatchVC.swift
//  WeldDataTest
//
//  Created by trevor wilson on 2023-11-05.
//


import UIKit

class RoundStopwatchView: UIView {
    
    private var timer: Timer?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0.0
    
    private lazy var startStopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(startStopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action:
                            #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            let circleRadius = min(bounds.width, bounds.height) / 2.5
            let circleOrigin = CGPoint(x: bounds.midX - circleRadius, y: bounds.midY - circleRadius)
            let circleRect = CGRect(origin: circleOrigin, size: CGSize(width: circleRadius * 2, height: circleRadius * 2))
            
            let circlePath = UIBezierPath(ovalIn: circleRect)
            UIColor.black.setStroke()
            circlePath.lineWidth = 6.0
            circlePath.stroke()
        }
    
    private func setupViews() {
        // Set up the start/stop button
        addSubview(startStopButton)
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startStopButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startStopButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10)
        ])
        
        // Set up the reset button
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: -5)
        ])
        
        // Set up the elapsed time label
        addSubview(elapsedTimeLabel)
        elapsedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            elapsedTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            elapsedTimeLabel.bottomAnchor.constraint(equalTo: startStopButton.topAnchor, constant: -3)
        ])
    }
    
    @objc private func startStopButtonTapped() {
        if timer != nil {
            stopTimer()
            startStopButton.setTitle("Start", for: .normal)
        } else {
            startTimer()
            startStopButton.setTitle("Stop", for: .normal)
        }
    }
    
    @objc private func resetButtonTapped() {
        resetTimer()
        startStopButton.setTitle("Start", for: .normal)
    }
    
    private func startTimer() {
        if timer == nil {
            startTime = Date()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel), userInfo: nil, repeats: true)
        }
    }
    
    private func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func resetTimer() {
        stopTimer()
        startTime = nil
        elapsedTime = 0.0
        updateElapsedTimeLabel()
    }
    
    @objc private func updateElapsedTimeLabel() {
        if let startTime = startTime {
            elapsedTime = Date().timeIntervalSince(startTime)
        }
        
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10))
        
        elapsedTimeLabel.text = String(format: "%02d:%02d:%01d", minutes, seconds, milliseconds)
    }
    
}




