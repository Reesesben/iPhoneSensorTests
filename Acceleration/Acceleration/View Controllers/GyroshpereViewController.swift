//
//  GyroshpereViewController.swift
//  Acceleration
//
//  Created by Ben Erekson on 10/21/21.
//

import UIKit
import CoreMotion

class GyroshpereViewController: UIViewController {
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
        manager.stopGyroUpdates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        manager.startGyroUpdates(to: motionQueue) { data, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            
            guard let data = data else { return }
            print()
            print("Rotation rate x: \(data.rotationRate.x)")
            print("Rotation rate y: \(data.rotationRate.y)")
            print("Rotation rate z: \(data.rotationRate.z)")
            print()
            
            DispatchQueue.main.async {
                self.xLabel.text = "Rotation rate x: \(data.rotationRate.x)"
                self.yLabel.text = "Rotation rate y: \(data.rotationRate.y)"
                self.zLabel.text = "Rotation rate z: \(data.rotationRate.z)"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
