//
//  ViewController.swift
//  GuessNumber
//
//  Created by Furkan Kaynar on 7.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Game()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let touchOnView = UITapGestureRecognizer(target: self, action: #selector(touchOnContainerView))
        view.addGestureRecognizer(touchOnView)
        
        resultLabel.text = ""
    }
    
    @objc func touchOnContainerView() {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillAppear() {
        self.view.frame.origin.y -= 200
    }
    
    @objc func keyboardWillDisappear() {
        self.view.frame.origin.y += 200
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func guessButtonTap(_ sender: Any) {
        if let number = Int(guessTf.text!) {
            resultLabel.text = game.hit(tryNumber: number)
        }
    }
    
    @IBAction func resetButtonTap(_ sender: Any) {
        game = Game()
        resultLabel.text = ""
    }
    
}

