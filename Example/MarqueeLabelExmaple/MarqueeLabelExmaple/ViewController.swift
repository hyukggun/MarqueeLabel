//
//  ViewController.swift
//  MarqueeLabelExmaple
//
//  Created by 최최광현 on 2/20/24.
//

import SwiftUI
import MarqueeLabel
import UIKit

class ViewController: UIViewController {
    
    let marqueeLabel = MarqueeLabel()
    
    let pinnedMarqueeLabel = MarqueeLabel()
    
    let startButton = UIButton()
    
    let stopButton = UIButton()
    
    let nextPageButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        marqueeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(marqueeLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(nextPageButton)
        
        marqueeLabel.text = "marqueeLabel test"
        pinnedMarqueeLabel.text = "pinned MarqueeLabel"
        
        startButton.setTitle("play marquee", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        
        stopButton.setTitle("stop marquee", for: .normal)
        stopButton.setTitleColor(.black, for: .normal)
        stopButton.layer.borderWidth = 1
        stopButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        nextPageButton.setTitle("next Page Button", for: .normal)
        nextPageButton.setTitleColor(.black, for: .normal)
        nextPageButton.layer.borderWidth = 1
        nextPageButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        NSLayoutConstraint.activate([
            marqueeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            marqueeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marqueeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            marqueeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            marqueeLabel.heightAnchor.constraint(equalToConstant: 100),
            
            startButton.topAnchor.constraint(equalTo: marqueeLabel.bottomAnchor, constant: 100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            stopButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 100),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            
            nextPageButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 100),
            nextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextPageButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        startButton.addTarget(self, action: #selector(startMarquee), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopMarquee), for: .touchUpInside)
        nextPageButton.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
        
        view.addSubview(pinnedMarqueeLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pinnedMarqueeLabel.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pinnedMarqueeLabel.frame = CGRect(origin: CGPoint(x: 10, y: view.bounds.maxY - 100), size: CGSize(width: view.bounds.width, height: 100))
    }
    
    @objc
    private func startMarquee() {
        marqueeLabel.start()
    }
    
    @objc
    private func stopMarquee() {
        marqueeLabel.stop()
    }
    
    @objc
    private func navigateToNextPage() {
        let examplePage = UIHostingController(rootView:  MarqueeLabelExmaplePage())
        examplePage.modalPresentationStyle = .fullScreen
        present(examplePage, animated: false)
    }
}

