//
//  ViewController.swift
//  BGP_Calculator
//
//  Created by Baravitski Aliaksandr on 31.12.20.
//

import UIKit

class ViewController: UIViewController {
    
    // var screenText
    var screenText: String = ""

    
    // VARs
    // var String to Double
    var screenNumDouble: Double = 0
    // saved Num (for result)
    var savedNumScreen: Double = 0
    // var for remember action (=)
    var lastAction = 0

    // CHECK FOR ACTIONS
    // check for sighn +/-/=/...
    var sighnCheckAction: Bool = false
    // check from double sighn (+/-/x/...)
    var sighnCheckDoubClick: Bool = false
    
    
    // FUNC
    // func for (=)
    func result(num: Int) {
        switch num {
        case 11:    // (÷)
            savedNumScreen /= screenNumDouble
            showScreen.text = "\(savedNumScreen)"
        case 12:    // (*)
            savedNumScreen *= screenNumDouble
            showScreen.text = "\(savedNumScreen)"
        case 13:    // (+)
            savedNumScreen += screenNumDouble
            showScreen.text = "\(savedNumScreen)"
        case 14:    // (+)
            savedNumScreen -= screenNumDouble
            showScreen.text = "\(savedNumScreen)"
        default:
            break
        }
    }


    
    // SCREEN SHOW (LABEL)
    @IBOutlet weak var showScreen: UILabel!
    


    // NUMBERS
    @IBAction func numbers(_ sender: UIButton) {

        if sighnCheckAction != true {
            // screenText for all params input
            showScreen.text = showScreen.text! + String(sender.tag)

        // check for selected sighn
        } else {
            showScreen.text = String(sender.tag)
            
            // back to default
            sighnCheckAction = false
            sighnCheckDoubClick = false
        }

        // screenText to Double
        screenNumDouble = Double(showScreen.text!)!
    }
    


    // BUTTONS FOR ACTIONs
    @IBAction func buttonAction(_ sender: UIButton) {

        // check for nil
        if showScreen.text != "" {

            switch sender.tag {
            
            // AC - all params to default
            case 10:
                showScreen.text     = ""
                screenNumDouble     = 0
                savedNumScreen      = 0
                lastAction          = 0
                sighnCheckAction    = false
                sighnCheckDoubClick = false
                
            // (÷)
            case 11:
                
                // check for last action (if after (*) use (÷)... )
                if lastAction == 0 {
                    
                    // check from double sighn (if use double (*/÷/+/-) )
                    if sighnCheckAction == false {
                        
                        // if first tape sighn
                        if savedNumScreen == 0 {
                            savedNumScreen = screenNumDouble
                            showScreen.text = "\(savedNumScreen)÷"
                            
                        // if second+ tape sighn
                        } else {
                            savedNumScreen /= screenNumDouble
                            showScreen.text = "\(savedNumScreen)÷"
                        }
                        
                        // protect from double click
                        sighnCheckDoubClick = true

                    // after (=) next action
                    } else {
                        showScreen.text = "\(savedNumScreen)÷"
                    }

                // if after (*) use (÷)...
                } else {
                    
                    // check from double sighn (if use double (*/÷/+/-)
                    if sighnCheckAction == false {
                        result(num: lastAction)
                        showScreen.text = "\(savedNumScreen)÷"
                        
                    // if change sighn for another (protect)
                    } else {
                        showScreen.text = "\(savedNumScreen)÷"
                    }
                    
                    // protect from double click
                    sighnCheckDoubClick = true
                }
                                
                // saved last action
                lastAction = 11
                
            // (x)
            case 12:
                
                // check for last action (if after (*) use (÷)... )
                if lastAction == 0 {
                    
                    // check from double sighn (if use double (*/÷/+/-) )
                    if sighnCheckAction == false {
                        
                        // if first tape sighn
                        if savedNumScreen == 0 {
                            savedNumScreen = screenNumDouble
                            showScreen.text = "\(savedNumScreen)×"
                            
                        // if second+ tape sighn
                        } else {
                            savedNumScreen *= screenNumDouble
                            showScreen.text = "\(savedNumScreen)×"
                        }
                        
                        // protect from double click
                        sighnCheckDoubClick = true

                    // after (=) next action
                    } else {
                        showScreen.text = "\(savedNumScreen)×"
                    }
                    
                // check for last action (if after (*) use (÷)... )
                } else {
                    
                    // check from double sighn (if use double (*/÷/+/-)
                    if sighnCheckAction == false {
                        result(num: lastAction)
                        showScreen.text = "\(savedNumScreen)×"
                        
                    // if change sighn for another (protect)
                    } else {
                        showScreen.text = "\(savedNumScreen)×"
                    }
                    
                    // protect from double click
                    sighnCheckDoubClick = true
                }

                // saved last action
                lastAction = 12
            
            // (+)
            case 13:
                
                // check for last action (if after (*) use (÷)... )
                if lastAction == 0 {
                    
                    // check from double sighn (if use double (*/÷/+/-) )
                    if sighnCheckAction == false {
                        
                        // if first tape sighn
                        if savedNumScreen == 0 {
                            savedNumScreen = screenNumDouble
                            showScreen.text = "\(savedNumScreen)+"
                            
                        // if second+ tape sighn
                        } else {
                            savedNumScreen += screenNumDouble
                            showScreen.text = "\(savedNumScreen)+"
                        }
                        
                        // protect from double click
                        sighnCheckDoubClick = true

                    // after (=) next action
                    } else {
                        showScreen.text = "\(savedNumScreen)+"
                    }
                    
                // check for last action (if after (*) use (÷)... )
                } else {
                    
                    // check from double sighn (if use double (*/÷/+/-)
                    if sighnCheckAction == false {
                        result(num: lastAction)
                        showScreen.text = "\(savedNumScreen)+"
                        
                    // if change sighn for another (protect)
                    } else {
                        showScreen.text = "\(savedNumScreen)+"
                    }
                    
                    // protect from double click
                    sighnCheckDoubClick = true
                }

                // saved last action
                lastAction = 13
                
            // (-)
            case 14:
                
                // check for last action (if after (*) use (÷)... )
                if lastAction == 0 {
                    
                    // check from double sighn (if use double (*/÷/+/-) )
                    if sighnCheckAction == false {
                        
                        // if first tape sighn
                        if savedNumScreen == 0 {
                            savedNumScreen = screenNumDouble
                            showScreen.text = "\(savedNumScreen)-"
                            
                        // if second+ tape sighn
                        } else {
                            savedNumScreen -= screenNumDouble
                            showScreen.text = "\(savedNumScreen)-"
                        }
                        
                        // protect from double click
                        sighnCheckDoubClick = true

                    // after (=) next action
                    } else {
                        showScreen.text = "\(savedNumScreen)-"
                    }
                    
                // check for last action (if after (*) use (÷)... )
                } else {
                    
                    // check from double sighn (if use double (*/÷/+/-)
                    if sighnCheckAction == false {
                        result(num: lastAction)
                        showScreen.text = "\(savedNumScreen)-"
                        
                    // if change sighn for another (protect)
                    } else {
                        showScreen.text = "\(savedNumScreen)-"
                    }
                    
                    // protect from double click
                    sighnCheckDoubClick = true
                }

                // saved last action
                lastAction = 14
                
            // (=)
            case 15:
                // check for double (=)
                if sighnCheckDoubClick == false {
                    result(num: lastAction)
                    
                    //
                    sighnCheckDoubClick = true
                    lastAction = 0
                }
            default:
                break
            }
            
            // block sighn for ScreenText
            sighnCheckAction = true
        }
    }
}
