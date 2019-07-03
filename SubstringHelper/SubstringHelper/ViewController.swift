//
//  ViewController.swift
//  SubstringHelper
//
//  Created by William Yen on 6/27/19.
//  Copyright © 2019 William Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //OUTLET AREA
    @IBOutlet weak var minimum_field: UITextField!
    @IBOutlet weak var maximum_field: UITextField!
    @IBOutlet weak var word_field: UITextField!
    @IBOutlet weak var instructions_label: UILabel!
    @IBOutlet weak var substring_label: UILabel!
    
    
    var minimum_index = -1
    var maximum_index = -1

    var target_word = ""
    
    //viewDidLoad is the first thing that happens
    //It loads the view controller and connects that view controller to the appDelagate, which makes the files and storyboards able to share variables information
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Welcome to the Substring Helper Program!")
        minimum_field.keyboardType = UIKeyboardType.numberPad;
        maximum_field.keyboardType = UIKeyboardType.numberPad;
    //end of the viewDidLoad method
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("\n\n...attempt to end editing...\n\n")
        self.view.endEditing(true)
        
        if (minimum_field.text?.count ?? 0 > 0) {
            print("There is information in the minimum_field area...")
            
            minimum_index = Int(minimum_field.text!)!
            
            print("The value of the minimum index is NOW: \(minimum_index) \n\n");
            
        } else {
            print("There isn't anything in the minimum_field area...")
            minimum_index = -1
        }
        
        if (maximum_field.text?.count ?? 0 > 0) {
            print("There is information in the maximum_field area...")
            
            maximum_index = Int(maximum_field.text!)!
            
            print("The value of the maximum index is NOW: \(maximum_index) \n\n");
            
        } else {
            print("There isn't anything in the maximum_field area...")
            maximum_index = -1
        }
        
        //Nothing in the fields
        if minimum_index == -1 && maximum_index == -1 {setInstructions(code:100)}
        
        print("The value of the minimum index is: \(minimum_index)");
        print("The value of the maximum index is: \(maximum_index)");
    
        if (word_field.text?.count ?? 0 > 0) {
            print ("There is information in the word_field area...")
            
            let word_rough = word_field.text!
            
            print ("The inputted word is: \(word_rough)")
            
            if verifyValidIndices(target: word_rough, start: minimum_index, stop: maximum_index) {
                
                print ("The indices seem valid for this word")
                setInstructions(code: 100)
                
                let data = getSubstring(phrase: word_rough, start: minimum_index, stop: maximum_index)
                
                print ("Your substring is: \(data)")
                
                substring_label.text = data
                
                //end of vVI check
            } else {
                print ("The indices do not seem to be valid for this word")
                setInstructions(code: 500)
                
                //TODO make label say invalid
            }
        //end of check for letters
        }
        
    //end of the touchesBegan..
    }
    
    func verifyValidIndices ( target: String, start: Int, stop: Int) -> Bool {
        if stop < 1 {return false}
        if start < 0 {return false}
        if start >= stop {return false}
        if stop > target.count {return false}
        if start >= target.count {return false}
        
        return true;
    //end of verifyValidIndices function
    }
    
    func setInstructions(code: Int) {
        if code == 500 {
            instructions_label.text = "ERROR -> Invalid Indices"
            
            substring_label.text = "";
            
        } else if code == 100 {
            instructions_label.text = "Your substring will appear below"
        }
        
    //end of setInstructions function
    }

    func getSubstring (phrase: String, start: Int, stop: Int) -> String {
        if (start < 0 || stop < 0) {
            return phrase
        }
        let front = phrase.index(phrase.startIndex, offsetBy: start)
        
        let back = phrase.index(phrase.startIndex, offsetBy: stop)
        
        let substring1 = phrase[front..<back]
        
        print (substring1);
        
        // cast as a String before returning
        return String (substring1);
    }
    
//end of the ViewController
}

