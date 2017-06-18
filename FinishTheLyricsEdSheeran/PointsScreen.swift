//
//  PointsScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import Social


class PointsScreen: UIViewController {
    
    @IBOutlet weak var pointsLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        pointsLbl.text = String(points)
    }
    
    
    

        //SOCIAL SHARING
    @IBAction func sharePressed(_ sender: Any) {
        
        //Alert
        let alert = UIAlertController(title: "Share Your Score!", message: "Share your Score and Compete with your Friends!", preferredStyle: .actionSheet)
        
        
        //First action
        let actionOne = UIAlertAction(title: "Share On Facebook", style: .default) {
            (action) in
            
            print("SUCCESS")
            
            //Checking if user has facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("I scored \(points) of 25 points on 'Guess the Ed Sheeran Lyrics!'")
                post.add(UIImage(named: "img.jpg"))
                    //ADD IMAGE!!!
                
                self.present(post, animated: true, completion: nil)
                
                
                
                
            } else {
                //pop-up to say you're not connected!
                self.showAlert(service: "Facebook")
            }
            
        }
        
        //Second Action
        let actionTwo = UIAlertAction(title: "Share On Twitter", style: .default) {
            (action) in
            
            print("SUCCESS")
            
            //Checking if user has facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("I scored \(points) of 25 points on 'Guess the Ed Sheeran Lyrics!'")
                post.add(UIImage(named: "img.jpg"))
                //ADD IMAGE!!!
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                //pop-up to say you're not connected!
                self.showAlert(service: "Twitter")
            }
            
        }
        
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present Alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showAlert(service: String) {
        
        let alert = UIAlertController(title: "Bummer!", message: "This device is not connected to \(service)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}
