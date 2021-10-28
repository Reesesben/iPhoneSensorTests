//
//  MagneticFieldViewController.swift
//  Acceleration
//
//  Created by Ben Erekson on 10/21/21.
//

import UIKit
import CoreMotion

class MagneticFieldViewController: UIViewController {
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
        manager.stopMagnetometerUpdates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        xLabel.text = "No sensor data."
        yLabel.text = ""
        zLabel.text = ""
        manager.startMagnetometerUpdates(to: motionQueue) { data, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            
            guard let data = data else { return }
            print()
            print("Magnetic field x: \(data.magneticField.x)")
            print("Magnetic field y: \(data.magneticField.y)")
            print("Magnetic field z: \(data.magneticField.z)")
            print()
            
            DispatchQueue.main.async {
                self.xLabel.text = "Magnetic field x: \(data.magneticField.x)"
                self.yLabel.text = "Magnetic field y: \(data.magneticField.y)"
                self.zLabel.text = "Magnetic field z: \(data.magneticField.z)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
