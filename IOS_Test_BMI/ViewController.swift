//
//  ViewController.swift
//  IOS_Test_BMI

// Student ID : 301094688
// BMI TRACKING APPLICATION
// Date : 11 DECEMBER 2019


//  Created by Nisha Tandel on 2019-12-11.
//  Copyright © 2019 Nisha TAndel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var categorizer = BMICategorizer()

    @IBOutlet weak var labelWeightPoint: UILabel!
    
    @IBOutlet weak var labelHeightPoint: UILabel!
    
    @IBOutlet weak var labelBMIresult: UILabel!
    
    @IBOutlet weak var labelSummary: UILabel!
    
    @IBOutlet weak var imageBMI: UIImageView!
    
    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var sliderHeight: UISlider!
    
    var weight: Float = 80.0
    var height: Float = 1.8
    var image: UIImage = #imageLiteral(resourceName: "normal")
    
    var bmi: Float {
        return weight / (height * height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderWeight.value = weight
        sliderHeight.value = height
            
        
        doCalculate()
        // Do any additional setup after loading the view.
        
    }
        func doCalculate() {
            if weight > 1 && height > 0 {
                // do calclutate
                self.labelWeightPoint.text = String(format: "%.1f", weight)
                self.labelHeightPoint.text = String(format: "%.1f", height)
                self.labelBMIresult.text = String(format: "%.1f", bmi)
                
                if let category = categorizer.checkCategory(bmi: self.bmi) {
                    self.labelSummary.text = category.categoryTitle
                    self.labelSummary.textColor = category.categoryColor
                    // image
                    self.imageBMI.image = category.image
                }
            }
         }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderWeightChange(_ sender: Any)
        
    {
        weight = sliderWeight.value
        
        print(weight)
        // calcluate
        doCalculate()
        
        
    }
    
    @IBAction func sliderHeightChange(_ sender: Any)
    {
        height = sliderHeight.value
        
        print(height)
        // calculate
        doCalculate()
        
    }
}



