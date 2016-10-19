//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    let stormButton = UIButton()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(sun)
        self.view.addSubview(moon)
        self.view.addSubview(cloud)
        self.view.addSubview(lightning)
        self.view.backgroundColor = UIColor.blue
        addStormButton()
        changeTheBackgoundColor()
        addConstrainToSun()
        addConstrainsToMoon()
        addConstrianToCloudAndLighting()
        self.cloud.alpha = 0
        self.lightning.alpha = 0
        changeSunAndMoonLocation()
        
        
        
    }
    
    func changeTheBackgoundColor() {
        
        UIView.animateKeyframes(withDuration: 20, delay: 0.0, options: [.repeat,.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration:1/4 , animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/4, animations: {
                self.view.backgroundColor = UIColor.black
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4, animations: {
                self.view.backgroundColor = UIColor.blue
            })
        })
    }
    
    func addConstrainToSun() {
        self.sun.frame = CGRect(x: self.view.frame.width + 0.5*self.sun.frame.width, y: self.view.frame.height + 0.5*self.sun.frame.height, width: 0.5*self.view.frame.width, height: 0.5*self.view.frame.width)
    }
    
    func addConstrainsToMoon() {
        self.moon.frame = CGRect(x: self.view.frame.width + 0.5*self.sun.frame.width, y: self.view.frame.height + 0.5*self.sun.frame.height, width: 0.5*self.view.frame.width, height: 0.5*self.view.frame.width)
    }
    
    func addConstrianToCloudAndLighting() {
        
        self.cloud.frame = CGRect(x: self.view.center.x - 100, y: self.view.center.y - 100 ,width: 0.5*self.view.frame.width, height: self.view.frame.width/2*552/1092)
        
        self.lightning.frame = CGRect(x: self.view.center.x - 50 , y: self.view.center.y + 5.5,width: 0.25*self.view.frame.width, height:0.35*self.view.frame.width/2)
        
    }
    
    
    func addStormButton() {
        
        view.addSubview(stormButton)
        stormButton.addTarget(self, action: #selector(cloudAndLighting), for: .touchUpInside)
        stormButton.isUserInteractionEnabled = true
        print("pressing button")
        
        stormButton.frame = CGRect(x: self.view.center.x - 25, y: self.view.center.y * 1.35, width: 50, height: 50)
        
        stormButton.setTitle("🌩", for: .normal)
        stormButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        stormButton.backgroundColor = UIColor.white
        
        stormButton.layer.borderWidth = 2
        stormButton.layer.borderColor = UIColor.gray.cgColor
        stormButton.layer.cornerRadius = 5
        stormButton.layer.masksToBounds = true
        
        
    }
    
    func changeSunAndMoonLocation() {
        UIView.animateKeyframes(withDuration: 20, delay: 0.0, options: [.repeat,.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/4, animations: {
                self.sun.center.x = self.view.center.x
                self.sun.center.y = self.view.center.y*0.25
            })
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4, animations: {
                
                self.sun.center.x = -0.5*self.view.bounds.width
                self.sun.center.y = self.view.bounds.height
                
            })
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/4, animations: {
                self.moon.center.x = self.view.center.x
                self.moon.center.y = self.view.center.y*0.25
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4, animations: {
                
                self.moon.center.x = -0.5*self.view.bounds.width
                self.moon.center.y = self.view.bounds.height
                
            })
            
            
        }) { (success) in
            self.sun.center.x = self.view.bounds.width + 0.5*self.sun.bounds.width
            self.sun.center.y = self.view.bounds.height + 0.5*self.sun.bounds.height
            self.moon.center.x = self.view.bounds.width + 0.5*self.moon.bounds.width
            self.moon.center.y = self.view.bounds.height + 0.5*self.moon.bounds.height
        }
    }
    
    func cloudAndLighting (_ button: UIButton) {
        UIView.animateKeyframes(withDuration: 8, delay: 0.0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/4, animations: {
                self.cloud.alpha = 1.0
                self.cloud.center.y = self.view.bounds.height/4
                self.lightning.alpha = 1.0
                self.lightning.center.y = self.view.bounds.height/4 + self.cloud.bounds.height - 5.5
            })
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 2/4, animations: {
                self.cloud.center.y = self.view.bounds.height/2
                self.lightning.center.y = self.view.bounds.height/2 + self.cloud.bounds.height - 5.5
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/8, animations: {
                self.cloud.alpha = 0.0
                self.lightning.alpha = 0.0
            })
            
            }, completion: nil)
        
    }
    
    
}

