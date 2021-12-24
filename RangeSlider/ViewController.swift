//
//  ViewController.swift
//  RangeSlider
//
//  Created by William Archimede on 08/09/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let rangeSlider1 = RangeSlider(frame: CGRect.zero)
    let rangeSlider2 = RangeSlider(frame: CGRect.zero)
    
    let label1 = UILabel()
    let label2 = UILabel()
   
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "1.0-5.0"
        return label
    }()
    
    private let step1 = 0.5
    private var betweenThumbsStepValue1: Double {
        let stepValue = (5.0 - 1.0) / step1
        let ratio = 1.0 / stepValue
        return ratio
    }
    
    private let step = 2.0
    private var betweenThumbsStepValue: Double {
        let stepValue = (36 - 18) / step + 1
        let ratio = 1.0 / stepValue
        return ratio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rangeSlider1.gapBetweenThumbs = betweenThumbsStepValue1
        rangeSlider1.trackHighlightTintColor = UIColor(red: 0.29, green: 0.16, blue: 0.82, alpha: 1)
        rangeSlider1.curvaceousness = 1.0
        rangeSlider1.minimumValue = 0
        rangeSlider1.maximumValue = 1.0
        rangeSlider1.lowerValue = 0
        rangeSlider1.upperValue = 1
        rangeSlider1.trackTintColor = UIColor(red: 0.93, green: 0.93, blue: 0.98, alpha: 1)

        rangeSlider2.gapBetweenThumbs = betweenThumbsStepValue
        rangeSlider2.trackHighlightTintColor = UIColor(red: 0.29, green: 0.16, blue: 0.82, alpha: 1)
        rangeSlider2.curvaceousness = 1.0
        rangeSlider2.minimumValue = 0
        rangeSlider2.maximumValue = 1.0
        rangeSlider2.lowerValue = 0
        rangeSlider2.upperValue = 1
        rangeSlider2.trackTintColor = UIColor(red: 0.93, green: 0.93, blue: 0.98, alpha: 1)
        
        view.addSubview(rangeSlider1)
        view.addSubview(rangeSlider2)
        
        rangeSlider1.addTarget(self, action: #selector(ViewController.rangeSliderValueChanged1(_:)), for: .valueChanged)
        rangeSlider2.addTarget(self, action: #selector(ViewController.rangeSliderValueChanged(_:)), for: .valueChanged)

        label1.text = "18"
        label2.text = "38"
        label1.textColor = .black
        label2.textColor = .black
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(valueLabel)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider1.frame = CGRect(x: margin + 20, y: margin + topLayoutGuide.length + 100,
                                    width: width - 40, height: 16)
        
        rangeSlider2.frame = CGRect(x: margin + 20, y: 5 * margin + topLayoutGuide.length + 100,
                                    width: width - 40, height: 16)
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leadingAnchor.constraint(equalTo: rangeSlider2.leadingAnchor).isActive = true
        label1.bottomAnchor.constraint(equalTo: rangeSlider2.topAnchor, constant: -20).isActive = true
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.trailingAnchor.constraint(equalTo: rangeSlider2.trailingAnchor).isActive = true
        label2.bottomAnchor.constraint(equalTo: rangeSlider2.topAnchor, constant: -20).isActive = true
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leadingAnchor.constraint(equalTo: rangeSlider1.leadingAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: rangeSlider1.topAnchor, constant: -20).isActive = true
    }
    
    @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
        
        let step = 2.0
        let stepValue = (36 - 18) / step + 1
        let ratio = 1.0 / stepValue
        // 从小到大 0 - 1.0
        let value = rangeSlider.lowerValue / ratio * step
        let resutl = floor(value) + 18
        print(resutl)
        
        label1.text = "\(resutl)"
        
        // 从大到小 1.0 - 0
        let value2 = rangeSlider.upperValue / ratio * step
        let resutl2 = floor(value2) + 18
        print(resutl2)
        label2.text = "\(resutl2)"
    }
    
    @objc func rangeSliderValueChanged1(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")

        // 从小到大 0 - 1.0
        let value = rangeSlider.lowerValue / betweenThumbsStepValue1 * step1
        let resutl = Double(Int(value * 10)) / 10.0 + 1.0

        // 从大到小 1.0 - 0
        let value2 = rangeSlider.upperValue / betweenThumbsStepValue1 * step1
        let resutl2 = Double(Int(value2 * 10)) / 10.0 + 1.0
        
        valueLabel.text = "\(resutl)-\(resutl2)"
        print(valueLabel.text)
    }
}
