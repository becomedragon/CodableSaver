//
//  ViewController.swift
//  CodableSaver
//
//  Created by 程晓龙 on 2019/5/31.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Save(_ sender: Any) {
        let model = Model(thinFaceValue: 0, beautyValue: 50, filterValue: 50, whiteValue: 50, eyeValue: 50, cameraPostion: 50, isTorch: false, countDown: true)
        CodableSaver.save(object: model, key: "model")
    }
    
    @IBAction func Read(_ sender: Any) {
        guard let model = CodableSaver.value(type: Model.self, key: "model") else {
            return
        }
        print(model)
    }
}

