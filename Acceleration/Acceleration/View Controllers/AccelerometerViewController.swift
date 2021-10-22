//
//  ViewController.swift
//  Acceleration
//
//  Created by Ben Erekson on 10/21/21.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var xLabel: UILabel!
    @IBOutlet var yLabel: UILabel!
    @IBOutlet var zLabel: UILabel!
    
    //MARK: - Properties
    let manager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    //MARK: - Lifecycles
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        manager.stopAccelerometerUpdates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        manager.startAccelerometerUpdates(to: motionQueue) { data, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            
            guard let data = data else { return }
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z
            
//            Uncomment to reduce concel spam v
//            let XRounded = round(x * 100) / 100.0
//            let YRounded = round(y * 100) / 100.0
//            let ZRounded = round(y * 100) / 100.0
            
            print()
            print("Accel X Value: \(x)")
            print("Accel y Value: \(y)")
            print("Accel z Value: \(z)")
            print()
            
            DispatchQueue.main.async {
                self.xLabel.text = "Accel X: \(x)"
                self.yLabel.text = "Accel y: \(y)"
                self.zLabel.text = "Accel z: \(z)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

