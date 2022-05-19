//
//  MainScreenController.swift
//  PlanetsAnimation
//
//  Created by Евгения Шарамет on 17.05.2022.
//

import Foundation
import UIKit

class MainScreenController: UIViewController {
    var sunLights: UIImageView?
    var sun: UIImageView?
    var earth: UIImageView?
    var moon: UIImageView?
    var star1: UIImageView?
    var star2: UIImageView?
    var star3: UIImageView?
    var meteor1: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here!")
        let view = MainScreenView()
        self.view = view
        self.sun = view.sunView
        self.sunLights = view.sunLightsView
        self.earth = view.earthView
        self.moon = view.moonView
        self.star1 = view.star1
        self.star2 = view.star2
        self.star3 = view.star3
        self.meteor1 = view.meteor1View
        
        NotificationCenter.default.addObserver(forName: Notification.Name("updateAnimation"), object: nil, queue: OperationQueue.main) { [weak self] (notification) in
            guard let self = self else {
                return
            }
            self.viewDidAppear(true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sunAnimation()
        earthAnimation()
        moonAnimation()
        starsAnimation()
        meteor1Animation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func sunAnimation() {
        let options: UIView.AnimationOptions = [.curveEaseInOut,
                                                .repeat,
                                                .autoreverse]
        
        UIImageView.animate(withDuration: 2.9,
                            delay: 0,
                            options: options,
                            animations: {
            self.sunLights?.frame.size.height *= 1.18
            self.sunLights?.frame.size.width *= 1.18
            
            self.sun?.frame.size.height *= 1.18
            self.sun?.frame.size.width *= 1.18
        }, completion: nil)
    }
    
    private func earthAnimation() {
        let orbit = CAKeyframeAnimation(keyPath: "position")
        guard let sunView = sun else {
            return
        }
        
        let myPath = UIBezierPath(arcCenter: sunView.center, radius: sunView.bounds.width * 1.4, startAngle: CGFloat(-(CGFloat(Double.pi / 2))), endAngle: CGFloat(2.0 * Double.pi - Double.pi / 2), clockwise: true).cgPath
        orbit.path = myPath
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        orbit.repeatCount = Float.infinity
        orbit.duration = 5.0
        self.earth?.layer.add(orbit, forKey: "orbit")
    }
    
    private func moonAnimation() {
        let orbit = CAKeyframeAnimation(keyPath: "position")
        
        guard let moon = moon else {
            return
        }
        
        let myPath = UIBezierPath(arcCenter: moon.center, radius: 70, startAngle: CGFloat(-(CGFloat(Double.pi / 2))), endAngle: CGFloat(2.0 * Double.pi - Double.pi / 2), clockwise: true).cgPath
        orbit.path = myPath
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        orbit.repeatCount = Float.infinity
        orbit.duration = 4.0
        self.moon?.layer.add(orbit, forKey: "orbit")
    }
    
    private func starsAnimation() {
        
        let rotation1 : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation1.toValue = NSNumber(value: Double.pi * 2)
        rotation1.duration = 9
        rotation1.isCumulative = true
        rotation1.repeatCount = Float.greatestFiniteMagnitude
        
        
        star1?.layer.add(rotation1, forKey: "rotationAnimation")
        
        let options: UIView.AnimationOptions = [.curveEaseInOut,
                                                .repeat,
                                                .autoreverse]
        UIImageView.animate(withDuration: 4,
                            delay: 0,
                            options: options,
                            animations: {
            self.star1?.frame.size.height *= 2
            self.star1?.frame.size.width *= 2
        })
        
        UIImageView.animate(withDuration: 6,
                            delay: 2,
                            options: options,
                            animations: {
            self.star2?.frame.size.height *= 2
            self.star2?.frame.size.width *= 2
        })
        
        UIImageView.animate(withDuration: 2,
                            delay: 0,
                            options: options,
                            animations: {
            self.star3?.frame.size.height *= 2
            self.star3?.frame.size.width *= 2
        })
        
        let rotation2 : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation2.toValue = NSNumber(value: Double.pi * 2)
        rotation2.duration = 7
        rotation2.isCumulative = true
        rotation2.repeatCount = Float.greatestFiniteMagnitude
        
        star2?.layer.add(rotation2, forKey: "rotationAnimation")
        
        let rotation3 : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation3.toValue = NSNumber(value: Double.pi * 2)
        rotation3.duration = 6
        rotation3.isCumulative = true
        rotation3.repeatCount = Float.greatestFiniteMagnitude
        
        star3?.layer.add(rotation3, forKey: "rotationAnimation")
    }
    
    private func meteor1Animation() {
        let orbit = CAKeyframeAnimation(keyPath: "position")
        guard let star2 = star2 else {
            return
        }
        
        let myPath = UIBezierPath(ovalIn: CGRect(x: star2.center.x - 200, y: star2.center.y, width: 900, height: 400)).cgPath
        orbit.path = myPath
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        orbit.repeatCount = Float.infinity
        orbit.duration = 5.0
        self.meteor1?.layer.add(orbit, forKey: "orbit")
    }
}
