//
//  ViewController.swift
//  ReactiveProgrammingBasic
//
//  Created by Xiaodan Wang on 6/26/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    
    var targetString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addObserver(self, forKeyPath: "targetString", options: [.old,.new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "targetString" {
     //       print("old:",change?[NSKeyValueChangeKey.oldKey] ?? "")
     //       print("new:",change?[NSKeyValueChangeKey.newKey] ?? "")
            
            resultLbl.text = self.value(forKey: "targetString") as! String
        }
    }
    
    @IBAction func changeTapped(_ sender: Any) {
        guard let text = tf.text else {
            return
        }
        self.setValue(text, forKey: "targetString")
    }

}

