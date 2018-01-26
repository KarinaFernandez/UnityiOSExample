//
//  ViewController.swift
//  Integrate
//
//  Created by Karina on 25/01/2018.
//  Copyright © 2018 Karina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var unityView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Into ViewController")
    }
    
    @IBAction func startUnity(sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.startUnity()
        
        unityView = UnityGetGLView()!
        
        self.view!.addSubview(unityView!)
        unityView!.translatesAutoresizingMaskIntoConstraints = false
        
        // look, non-full screen unity content!
        let views = ["view": unityView]
        let w = NSLayoutConstraint.constraints(withVisualFormat: "|-100-[view]-100-|", options: [], metrics: nil, views: views)
        let h = NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[view]-50-|", options: [], metrics: nil, views: views)
        view.addConstraints(w + h)
    }
    
    @IBAction func stopUnity(sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.stopUnity()
        unityView!.removeFromSuperview()
    }

}
