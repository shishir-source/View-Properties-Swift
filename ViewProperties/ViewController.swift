//
//  ViewController.swift
//  ViewProperties
//
//  Created by Shishir Ahmed on 19/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var nextTiltle: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    //Bottom Button
    
    @IBOutlet weak var toggoleBtn: RoundButton!
    @IBOutlet weak var shufleBtn: RoundButton!
    @IBOutlet weak var heartBtn: RoundButton!
    @IBOutlet weak var repeatBtn: RoundButton!
    
    var shufleCenter: CGPoint!
    var heartCenter: CGPoint!
    var repeatCenter: CGPoint!
    
    var isClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage.alpha = 0
        logoView.alpha = 0
        nextButton.alpha = 0
        nextTiltle.alpha = 0
        descLabel.alpha = 0
        
    }
    
    override func viewDidLayoutSubviews() {
        
        shufleCenter = shufleBtn.center
        heartCenter = heartBtn.center
        repeatCenter = repeatBtn.center
        
        shufleBtn.center = toggoleBtn.center
        heartBtn.center = toggoleBtn.center
        repeatBtn.center = toggoleBtn.center
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 1
        }) { (true) in
            self.showLogo()
        }
    }
    
    public func showLogo() {
        UIView.animate(withDuration: 1, animations: {
            self.logoView.alpha = 1
        }) { (true) in
            self.showDescription()
        }
    }
    
    func showDescription() {
        UIView.animate(withDuration: 1, animations: {
            self.descLabel.alpha = 1
        }) { (true) in
            self.showButtontext()
        }
    }
    
    func showButtontext() {
        UIView.animate(withDuration: 1) {
            self.nextButton.alpha = 1
            self.nextTiltle.alpha = 1
        }
    }
    
    private func customNavbar() {
        
        //        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        navigationController?.navigationBar.shadowImage = UIImage()
                
        //        navigationController?.navigationBar.prefersLargeTitles = true
        
        let label1 = UILabel()
        label1.text = "New"
        label1.font  = UIFont(name: "Menlo", size: 50)
        label1.textColor = .white
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.text = "Hour"
        label2.font  = UIFont(name: "Sans-pro", size: 50)
        label2.textColor = .white
        label2.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [label1, label2])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.frame.size.width = label1.frame.width + label2.frame.width
        stackView.frame.size.height = max(label1.frame.height, label2.frame.height)
        
        navigationItem.titleView = stackView
    }
    
    //MARK:: - Selectors
    
    @IBAction func moreBtnPressed(_ sender: Any) {
        if isClicked == false {
            UIView.animate(withDuration: 0.3) {
                self.shufleBtn.alpha = 1
                self.heartBtn.alpha = 1
                self.repeatBtn.alpha = 1
                self.shufleBtn.center = self.shufleCenter
                self.heartBtn.center = self.heartCenter
                self.repeatBtn.center = self.repeatCenter
                
                self.isClicked = true
            }
            
        }else{
            UIView.animate(withDuration: 0.3) {
                
                self.shufleBtn.alpha = 0
                self.heartBtn.alpha = 0
                self.repeatBtn.alpha = 0
                
                self.shufleBtn.center = self.toggoleBtn.center
                self.heartBtn.center = self.toggoleBtn.center
                self.repeatBtn.center = self.toggoleBtn.center
                self.isClicked = false
            }
         
            
        }
    }
    
    private func toggleButton(button: UIButton, tintColor: UIColor) {
        
    }
}

