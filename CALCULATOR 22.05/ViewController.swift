//
//  ViewController.swift
//  CALCULATOR 22.05
//
//  Created by Elaidzha Shchukin on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    
    @IBOutlet weak var result: UILabel!
    
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else{
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons (_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 17 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 13 { // Деление
                result.text = "/";
            }
            if sender.tag == 14 { // Умножение
                result.text = "*";
            }
            if sender.tag == 15 { // Вычитание
                result.text = "-";
            }
            if sender.tag == 16 { // Добавление
                result.text = "+"
            }
            
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 17 { // Посчитать всё
            if operation == 13 {
                result.text = String(firstNum / numberFromScreen)
            }
            else if operation == 14 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if operation == 15 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 16 {
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

