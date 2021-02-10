//
//  ViewController.swift
//  BMI Calculator
//
//  Author: Charles Ryan Barrett
//  Date: 2/9/2021
//  Description: A simple BMI calculator based on the YMCA BMI equation.
//  Made for Assignment 3 in CSC 308 at EKU

import UIKit

class ViewController: UIViewController {
    // Variable to count gender/sex
    var genMale = true //Boolean is quicker/simpler than string comparison
    // Variable to check if pounds/kilog
    var metricW = false
    // Variable to check if inches/centi
    var metricL = false
    
    //Name text field outlet
    @IBOutlet weak var userName: UITextField!
    
    //Weight text field outlet
    @IBOutlet weak var userW: UITextField!
    
    //Waist text field outlet
    @IBOutlet weak var userL: UITextField!
    
    //Output with BMI text field outlet
    @IBOutlet weak var output: UITextView!
    
    //Button outlet; this is just to make it nicer looking
    @IBOutlet weak var bmiBTN: UIButton!
    
    
    //Close keyboard once finished with entering text/numbers
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    
    //Gender segment changed
    @IBAction func genderSwitch(_ sender: UISegmentedControl) {
        let gen = sender.selectedSegmentIndex
        
        if gen == 0{
            genMale = true
        }
        else{
            genMale = false
        }
    }
    
    //Weight metric changed
    @IBAction func weightMetric(_ sender: UISegmentedControl) {
        let weight = sender.selectedSegmentIndex
        
        if weight == 0{
            metricW = false
        }
        else{
            metricW = true
        }
    }
    
    //Waist metric changed
    @IBAction func waistMetric(_ sender: UISegmentedControl) {
        let waist = sender.selectedSegmentIndex
        
        if waist == 0{
            metricL = false
        }
        else{
            metricL = true
        }
    }
    
    //This function checks that all user input fields are not blank
    func noBlank() -> Bool {
        if (userName.text!.isEmpty || userW.text!.isEmpty || userL.text!.isEmpty){
            return false
        }
        else{
            return true
        }
    }
    
    //This function will convert kilograms to pounds
    func convKilo( Kilograms weight: Double) -> Double {
        //print("\(weight) kilos to pound is \(weight*2.20462)")
        return weight*2.20462
    }
    
    //This function will convert centimeters to inches
    func convCinti(Centimeters len: Double) -> Double {
        //print("\(len) centi to inches is \(len/2.54)")
        return len/2.54
    }
    
    //Calculate the BMI
    func calcBMI(Weight weight: Double, Waist len: Double) -> Double {
        //Check if male or female
        if genMale{
            return ((-98.42 + 4.15*len - 0.082*weight)/weight)*100
        }
        else{
            return ((-78.76 + 4.15*len - 0.082*weight)/weight)*100
        }
    }
    
    // "Get BMI" button is pressed
    @IBAction func showBMI(_ sender: UIButton) {
        //First, make sure no fields have been left blank
        if noBlank(){
            //weight
            var weightVal = Double(userW.text!)
            //length
            var lengthVal = Double(userL.text!)
            
            //Next, check what measurement units we have
            if metricW{
                weightVal = convKilo(Kilograms: weightVal!)
            }
            if metricL{
                lengthVal = convCinti(Centimeters: lengthVal!)
            }
            
            //get their BMI
            //var bmi1 = calcBMI(Weight: weightVal!, Waist: lengthVal!)
            //Get BMI and convert to string and 2 decimal places
            let bmi = String(format: "%.2f", calcBMI(Weight: weightVal!, Waist: lengthVal!))
            print(bmi)
            
            //Now Display the information
            // I tried to do the replacing method like in the lecture, but it didn't seem to work in strings instead of the text of a textfield.
            output.text = "Hello, \(userName.text!)!\nYour body fat percentage is estimated to be aproximately \(bmi)%."
        }
        else{
            //show error message that some/all fields are blank
            let blankMSG = UIAlertController(title: "Required Field(s) Blank", message: "One, or more, of the required fields is blank. Please check them and try again.", preferredStyle: UIAlertController.Style.alert)
            blankMSG.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(blankMSG, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make Get BMI button stand out more and look nicer
        bmiBTN.layer.cornerRadius = 30.0
        //Might as well make the output look nicer, too
        output.layer.cornerRadius = 10.0
    }


}

