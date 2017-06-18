//
//  ViewController.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-13.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GoogleMobileAds


var levelChosen: String!

class HomeScreen: UIViewController, GADBannerViewDelegate {
    
    
    @IBOutlet weak var bannerAd: GADBannerView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //BANNER AD:
        // Request
        let requestBanner = GADRequest()
        requestBanner.testDevices = [kGADSimulatorID]
        
        //Set Up Ad
        bannerAd.adUnitID = "ca-app-pub-8878911622308650/3001363526"
        
        //Making view controller responsible for ad unit
        bannerAd.rootViewController = self
        bannerAd.delegate = self
        
        bannerAd.load(requestBanner)
        //
        
        
        
    }

    @IBAction func easyPressed(_ sender: Any) {
        levelChosen = "Easy"
    }

    @IBAction func hardPressed(_ sender: Any) {
        
    levelChosen = "Hard"
    }
    
    

}

