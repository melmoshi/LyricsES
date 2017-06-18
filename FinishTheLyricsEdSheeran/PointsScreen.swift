//
//  PointsScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit

class PointsScreen: UIViewController {
    
    @IBOutlet weak var pointsLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        pointsLbl.text = String(points)
    }



}
