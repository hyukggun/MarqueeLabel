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
    
    let defaultMarqueeLabel = MarqueeLabel()
    
    let fullLengthMarqueeLabel = MarqueeLabel()
    
    let pinnedMarqueeLabel = MarqueeLabel()
    
    let startDefaultMarqueeButton = UIButton()
    
    let stopDefaultMarqueeButton = UIButton()
    
    let startFullLengthMarqueeButton = UIButton()
    
    let stopFullLengthMarqueeButton = UIButton()
    
    let nextPageButton = UIButton()
    
    private let lorem_ipsum_sample_text = "Lorem ipsum dolor sit amet, stet ponderum tractatos id quo, ex quo malis nominavi. "

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultMarqueeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullLengthMarqueeLabel.translatesAutoresizingMaskIntoConstraints = false
        startDefaultMarqueeButton.translatesAutoresizingMaskIntoConstraints = false
        stopDefaultMarqueeButton.translatesAutoresizingMaskIntoConstraints = false
        startFullLengthMarqueeButton.translatesAutoresizingMaskIntoConstraints = false
        stopFullLengthMarqueeButton.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(defaultMarqueeLabel)
        view.addSubview(fullLengthMarqueeLabel)
        view.addSubview(startDefaultMarqueeButton)
        view.addSubview(stopDefaultMarqueeButton)
        view.addSubview(startFullLengthMarqueeButton)
        view.addSubview(stopFullLengthMarqueeButton)
        view.addSubview(nextPageButton)
        
        defaultMarqueeLabel.text = lorem_ipsum_sample_text
        defaultMarqueeLabel.numberOfLines = 1
        defaultMarqueeLabel.clipsToBounds = true
        
        fullLengthMarqueeLabel.text = lorem_ipsum_sample_text
        fullLengthMarqueeLabel.numberOfLines = 1
        fullLengthMarqueeLabel.clipsToBounds = true
        fullLengthMarqueeLabel.subLabelSizeStrategy = FullLengthSubLabelSizeStrategy()
        
        pinnedMarqueeLabel.text = "pinned MarqueeLabel"
        
        startDefaultMarqueeButton.setTitle("play default marquee", for: .normal)
        startDefaultMarqueeButton.setTitleColor(.black, for: .normal)
        startDefaultMarqueeButton.layer.borderWidth = 1
        startDefaultMarqueeButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        stopDefaultMarqueeButton.setTitle("stop default marquee", for: .normal)
        stopDefaultMarqueeButton.setTitleColor(.black, for: .normal)
        stopDefaultMarqueeButton.layer.borderWidth = 1
        stopDefaultMarqueeButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        
        startFullLengthMarqueeButton.setTitle("play full length marquee", for: .normal)
        startFullLengthMarqueeButton.titleLabel?.font = .systemFont(ofSize: 12)
        startFullLengthMarqueeButton.titleLabel?.sizeToFit()
        startFullLengthMarqueeButton.setTitleColor(.black, for: .normal)
        startFullLengthMarqueeButton.layer.borderWidth = 1
        startFullLengthMarqueeButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        stopFullLengthMarqueeButton.setTitle("stop full Length marquee", for: .normal)
        stopFullLengthMarqueeButton.titleLabel?.font = .systemFont(ofSize: 12)
        stopFullLengthMarqueeButton.titleLabel?.sizeToFit()
        stopFullLengthMarqueeButton.setTitleColor(.black, for: .normal)
        stopFullLengthMarqueeButton.layer.borderWidth = 1
        stopFullLengthMarqueeButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        nextPageButton.setTitle("next Page Button", for: .normal)
        nextPageButton.setTitleColor(.black, for: .normal)
        nextPageButton.layer.borderWidth = 1
        nextPageButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.12).cgColor
        
        NSLayoutConstraint.activate([
            defaultMarqueeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            defaultMarqueeLabel.widthAnchor.constraint(equalToConstant: 200),
            defaultMarqueeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            defaultMarqueeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            startDefaultMarqueeButton.topAnchor.constraint(equalTo: defaultMarqueeLabel.bottomAnchor, constant: 20),
            startDefaultMarqueeButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            startDefaultMarqueeButton.heightAnchor.constraint(equalToConstant: 50),
            
            stopDefaultMarqueeButton.topAnchor.constraint(equalTo: defaultMarqueeLabel.bottomAnchor, constant: 20),
            stopDefaultMarqueeButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            stopDefaultMarqueeButton.heightAnchor.constraint(equalToConstant: 50),
            
            fullLengthMarqueeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            fullLengthMarqueeLabel.widthAnchor.constraint(equalToConstant: 200),
            fullLengthMarqueeLabel.topAnchor.constraint(equalTo: startDefaultMarqueeButton.bottomAnchor, constant: 20),
            fullLengthMarqueeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            startFullLengthMarqueeButton.topAnchor.constraint(equalTo: fullLengthMarqueeLabel.bottomAnchor, constant: 20),
            startFullLengthMarqueeButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            startFullLengthMarqueeButton.heightAnchor.constraint(equalToConstant: 50),
            
            stopFullLengthMarqueeButton.topAnchor.constraint(equalTo: fullLengthMarqueeLabel.bottomAnchor, constant: 20),
            stopFullLengthMarqueeButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            stopFullLengthMarqueeButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            nextPageButton.topAnchor.constraint(equalTo: stopFullLengthMarqueeButton.bottomAnchor, constant: 100),
            nextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextPageButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        startDefaultMarqueeButton.addTarget(self, action: #selector(startMarquee), for: .touchUpInside)
        stopDefaultMarqueeButton.addTarget(self, action: #selector(stopMarquee), for: .touchUpInside)
        startFullLengthMarqueeButton.addTarget(self, action: #selector(startFullLengthMarquee), for: .touchUpInside)
        stopFullLengthMarqueeButton.addTarget(self, action: #selector(stopFullLengthMarquee), for: .touchUpInside)
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
        defaultMarqueeLabel.start()
    }
    
    @objc
    private func stopMarquee() {
        defaultMarqueeLabel.stop()
    }
    
    @objc
    private func startFullLengthMarquee() {
        fullLengthMarqueeLabel.start()
    }
    
    @objc
    private func stopFullLengthMarquee() {
        fullLengthMarqueeLabel.stop()
    }
    
    @objc
    private func navigateToNextPage() {
        let examplePage = UIHostingController(rootView:  MarqueeLabelExmaplePage())
        examplePage.modalPresentationStyle = .fullScreen
        present(examplePage, animated: false)
    }
}

