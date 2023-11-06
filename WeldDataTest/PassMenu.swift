//
//  PassMenu.swift
//  WeldDataTest
//
//  Created by trevor wilson on 2023-11-05.
//

import UIKit

class PassMenu: UITableViewController {
    
    var lastSelectedTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.title = lastSelectedTitle
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Title if Root
//        if segue.identifier == "RootPassSegue" {
//               // Access destination view controller
//               if let destinationVC = segue.destination as? SliderGridViewController {
//                   // Set the page title property of the destination view controller
//                   destinationVC.customTitleLabel.text = "Root"
//               }
//           }
        switch segue.identifier{
        case "RootPassSegue":
            if let destinationVC = segue.destination as? SliderGridViewController {
                destinationVC.customTitleLabel.text = "Root"
            }
        case "HotPassSegue":
            if let destinationVC = segue.destination as? SliderGridViewController {
                destinationVC.customTitleLabel.text = "Hot Pass"
            }
        case "Fill1Segue":
            if let destinationVC = segue.destination as? SliderGridViewController {
                destinationVC.customTitleLabel.text = "Fill 1"
            }
        case "Fill2Segue":
            if let destinationVC = segue.destination as? SliderGridViewController {
                destinationVC.customTitleLabel.text = "Fill 2"
            }
        case "CapSegue":
            if let destinationVC = segue.destination as? SliderGridViewController {
                destinationVC.customTitleLabel.text = "Cap"
            }
        default:
            segue.destination.title = lastSelectedTitle
        }
        
       }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lastSelectedTitle = (tableView.cellForRow(at: indexPath)?.textLabel?.text!)!
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "RootPassSegue", sender: self)
//        case 1:
//            performSegue(withIdentifier: "MarkersLabelsSegue", sender: self)
//        case 2:
//            performSegue(withIdentifier: "DoubleHandleSegue", sender: self)
//        case 3:
//            performSegue(withIdentifier: "GradientColorsSegue", sender: self)
//        case 4:
//            performSegue(withIdentifier: "StopWatchSegue", sender: self)
//        case 5:
//            performSegue(withIdentifier: "RootPassSegue", sender: self)
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

