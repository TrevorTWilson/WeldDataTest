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

        // Prepare appropriate Title for instance of SliderGridVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
        case 1:
            performSegue(withIdentifier: "HotPassSegue", sender: self)
        case 2:
            performSegue(withIdentifier: "Fill1Segue", sender: self)
        case 3:
            performSegue(withIdentifier: "Fill2Segue", sender: self)
        case 4:
            performSegue(withIdentifier: "CapSegue", sender: self)
        default:
            break
        }
        
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

