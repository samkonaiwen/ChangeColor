//
//  ViewController.swift
//  ChangeColor
//
//  Created by SAM on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var inNoutSegment: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var randomForAlphaSwitch: UISwitch!
    
    var bodyR: Float = 128/255
    var bodyG: Float = 192/255
    var bodyB: Float = 230/255
    var bodyA: Float = 1
    
    var backR:Float = 176/255
    var backG:Float = 163/255
    var backB:Float = 171/255
    var backA:Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 身體圖案產生
        var image = UIImage(named: "Body")
        let bodyImageView = UIImageView(image: image)
        bodyImageView.frame = bodyView.bounds
        bodyImageView.contentMode = .scaleAspectFit
        bodyView.mask = bodyImageView
        bodyView.backgroundColor = UIColor(red: 128/255, green: 192/255, blue: 230/255, alpha: 0.7)
        // 殼圖案產產生
        image = UIImage(named: "Back")
        let backImageView = UIImageView(image: image)
        backImageView.frame = backView.bounds
        backImageView.contentMode = .scaleAspectFit
        backView.mask = backImageView
        backView.backgroundColor = UIColor(red: 176/255, green: 163/255, blue: 171/255, alpha: 0.7)
        
        // Ｓlider預設值
        redSlider.value = 128/255
        greenSlider.value = 192/255
        blueSlider.value = 230/255
        alphaSlider.value = 0.5
        
    }

    @IBAction func colorSliderChanged(_ sender: UISlider) {
        let inNoutNum = inNoutSegment.selectedSegmentIndex
        if inNoutNum == 0 {
            bodyR = redSlider.value
            bodyG = greenSlider.value
            bodyB = blueSlider.value
            bodyA = alphaSlider.value
            bodyView.backgroundColor = UIColor(red: CGFloat(bodyR), green: CGFloat(bodyG), blue: CGFloat(bodyB), alpha: CGFloat(bodyA))
        }else{
            backR = redSlider.value
            backG = greenSlider.value
            backB = blueSlider.value
            backA = alphaSlider.value
            backView.backgroundColor = UIColor(red: CGFloat(backR), green: CGFloat(backG), blue: CGFloat(backB), alpha: CGFloat(backA))
        }
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaLabel.text = String(format: "%.0f", alphaSlider.value * 100) + "%"
    }
    
    @IBAction func randomRGBA(_ sender: Any) {
        let randomR = Float.random(in: 0.0 ... 1.0)
        let randomG = Float.random(in: 0.0 ... 1.0)
        let randomB = Float.random(in: 0.0 ... 1.0)
        let randomA = Float.random(in: 0.0 ... 1.0)
        let alphaSwitch = randomForAlphaSwitch.isOn
        
        if inNoutSegment.selectedSegmentIndex == 0 {
            bodyR = randomR
            bodyG = randomG
            bodyB = randomB
            
            if alphaSwitch {
                bodyA = randomA
            }
            bodyView.backgroundColor = UIColor(red: CGFloat(bodyR), green: CGFloat(bodyG), blue: CGFloat(bodyB), alpha: CGFloat(bodyA))
        } else {
            backR = randomR
            backG = randomG
            backB = randomB
            
            if alphaSwitch {
                backA = randomA
            }
            backView.backgroundColor = UIColor(red: CGFloat(backR), green: CGFloat(backG), blue: CGFloat(backB), alpha: CGFloat(backA))
        }
        redSlider.setValue(randomR, animated: true)
        greenSlider.setValue(randomG, animated: true)
        blueSlider.setValue(randomB, animated: true)
        if alphaSwitch{
            alphaSlider.setValue(randomA, animated: true)
        }
        
        redLabel.text = String(format: "%.0f", randomR * 255)
        greenLabel.text = String(format: "%.0f", randomR * 255)
        blueLabel.text = String(format: "%.0f", randomR * 255)
        if alphaSwitch {
            alphaLabel.text = String(format: "%.0f", randomA * 100) + "%"
        }
    }
    
    @IBAction func inNoutSegmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            redSlider.setValue(bodyR, animated: true)
            greenSlider.setValue(bodyG, animated: true)
            blueSlider.setValue(bodyB, animated: true)
            alphaSlider.setValue(bodyA, animated: true)
            
            redLabel.text = String(format: "%.0f", bodyR * 255)
            greenLabel.text = String(format: "%.0f", bodyG * 255)
            blueLabel.text = String(format: "%.0f", bodyB * 255)
            alphaLabel.text = String(format: "%.0f", bodyA * 100) + "%"
        } else {
            redSlider.setValue(backR, animated: true)
            greenSlider.setValue(backG, animated: true)
            blueSlider.setValue(backB, animated: true)
            alphaSlider.setValue(backA, animated: true)
            
            redLabel.text = String(format: "%.0f", backR * 255)
            greenLabel.text = String(format: "%.0f", backG * 255)
            blueLabel.text = String(format: "%.0f", backB * 255)
            alphaLabel.text = String(format: "%.0f", backA * 100) + "%"
        }
    }
    
}

