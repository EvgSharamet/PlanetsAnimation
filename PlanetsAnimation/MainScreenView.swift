//
//  MainScreenView.swift
//  PlanetsAnimation
//
//  Created by Евгения Шарамет on 17.05.2022.
//

import Foundation
import UIKit

class MainScreenView: UIView {
    //MARK: - data
    
    let sunView = UIImageView()
    let sunLightsView = UIImageView()
    let earthView = UIImageView()
    let moonView = UIImageView()
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let meteor1View = UIImageView()
    
    //MARK: - public functions
    init() {
        super.init(frame: .zero)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private functions
    
    private func prepare() {
        setupBackground()
        setupSunLights()
        setupStar1()
        setupStar2()
        setupStar3()
        setupSun()
        setupEarth()
        setupMoon()
        setupMeteor1()
    }
    
    private func setupBackground() {
        let backgroundImageView = UIImageView()
        self.addSubview(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "background")
    }
    
    private func setupSunLights() {
        self.addSubview(sunLightsView)
        sunLightsView.translatesAutoresizingMaskIntoConstraints = false
        sunLightsView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sunLightsView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sunLightsView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        sunLightsView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        sunLightsView.image = UIImage(named: "sunLights")
    }
    
    private func setupSun() {
        self.addSubview(sunView)
        sunView.translatesAutoresizingMaskIntoConstraints = false
        sunView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sunView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).isActive = true
        sunView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sunView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sunView.image = UIImage(named: "sun")
    }
    
    private func setupEarth() {
        self.addSubview(earthView)
        earthView.translatesAutoresizingMaskIntoConstraints = false
        earthView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        earthView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        earthView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        earthView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        earthView.image = UIImage(named: "earth")
    }
    
    private func setupMoon() {
        self.earthView.addSubview(moonView)
        moonView.translatesAutoresizingMaskIntoConstraints = false
        moonView.centerXAnchor.constraint(equalTo: earthView.centerXAnchor).isActive = true
        moonView.centerYAnchor.constraint(equalTo: earthView.centerYAnchor).isActive = true
        moonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        moonView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        moonView.image = UIImage(named: "moon")
    }
    
    private func setupStar1() {
        self.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 90).isActive = true
        star1.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -90).isActive = true
        star1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        star1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        star1.image = UIImage(named: "star")
    }
    
    private func setupStar2() {
        self.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 70).isActive = true
        star2.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  80).isActive = true
        star2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        star2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        star2.image = UIImage(named: "star")
    }
    
    private func setupStar3() {
        self.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -60).isActive = true
        star3.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  140).isActive = true
        star3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        star3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        star3.image = UIImage(named: "star")
    }
    
    private func setupMeteor1() {
        self.addSubview(meteor1View)
        meteor1View.translatesAutoresizingMaskIntoConstraints = false
        meteor1View.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -60).isActive = true
        meteor1View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  150).isActive = true
        meteor1View.heightAnchor.constraint(equalToConstant: 140).isActive = true
        meteor1View.widthAnchor.constraint(equalToConstant: 140).isActive = true
        meteor1View.image = UIImage(named: "meteor")
    }
}
