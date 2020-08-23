//
//  FoodVC.swift
//  ViewProperties
//
//  Created by Shishir Ahmed on 19/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class FoodVC: UIViewController {

    @IBOutlet weak var cardView: UIViewX!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var divisor: CGFloat!
    
    //Bottom Menu bar
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: UIViewX!
    @IBOutlet weak var toogleMenuBtn: UIButton!
    @IBOutlet weak var playBtn: RoundButton!
    @IBOutlet weak var pauseBtn: RoundButton!
    @IBOutlet weak var backwardBtn: RoundButton!
    @IBOutlet weak var forwardBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        divisor = (view.frame.width / 2) / 0.61
        
        playBtn.alpha = 0
        pauseBtn.alpha = 0
        backwardBtn.alpha = 0
        forwardBtn.alpha = 0
    }

    @IBAction func toggleMenu(_ sender: Any) {
        
        if darkFillView.transform == CGAffineTransform.identity {
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -59)
                self.toogleMenuBtn.transform = CGAffineTransform(rotationAngle: self.radians(180))
            }) { (true) in
                UIView.animate(withDuration: 0.5) {
                    self.toggleMusicButton()
                }
            }
        }else{
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = .identity
                self.menuView.transform = .identity
                self.toogleMenuBtn.transform = .identity
                self.toggleMusicButton()
            })
        }
    }
    
    func toggleMusicButton() {
        let alpha = CGFloat(playBtn.alpha == 0 ? 1: 0)
        playBtn.alpha = alpha
        pauseBtn.alpha = alpha
        backwardBtn.alpha = alpha
        forwardBtn.alpha = alpha
    }
    
    func radians(_ degrees: Double) -> CGFloat {
        return CGFloat(degrees * .pi / degrees)
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter) ,1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "like")
            thumbImageView.tintColor = UIColor.green
        }else{
            thumbImageView.image = #imageLiteral(resourceName: "dont")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                }
                card.alpha = 0
                return
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                }
                card.alpha = 0
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
            }
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    private func reset() {
        UIView.animate(withDuration: 0.2) {
            self.cardView.center = self.view.center
            self.thumbImageView.alpha = 0
            self.cardView.alpha = 1
            self.cardView.transform = .identity
        }
    }
    
}
