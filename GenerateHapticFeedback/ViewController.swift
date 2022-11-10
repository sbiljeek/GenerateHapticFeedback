//
//  ViewController.swift
//  GenerateHapticFeedback
//
//  Created by Salman Biljeek on 11/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemTeal
        
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 18)
        configuration.attributedTitle = AttributedString("Haptic Feedback", attributes: container)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 25, bottom: 25, trailing: 25)
        configuration.baseBackgroundColor = .systemIndigo
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(self.handleButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc fileprivate func handleButtonTapped() {
        self.generateHapticFeedback(hapticFeedbackType: .Impact, notificationFeedbackType: nil, impactFeedbackType: .medium)
    }
    
    enum HapticFeedbackTypes {
        case Notification
        case Impact
        case Selection
    }
    
    fileprivate func generateHapticFeedback(hapticFeedbackType: HapticFeedbackTypes, notificationFeedbackType: UINotificationFeedbackGenerator.FeedbackType? = nil, impactFeedbackType: UIImpactFeedbackGenerator.FeedbackStyle? = nil) {
        switch hapticFeedbackType {
        case .Notification:
            let generator = UINotificationFeedbackGenerator()
            switch notificationFeedbackType {
            case .error:
                generator.notificationOccurred(.error)
            case .success:
                generator.notificationOccurred(.success)
            case .warning:
                generator.notificationOccurred(.warning)
            default:
                generator.notificationOccurred(.success)
            }
            
        case .Impact:
            switch impactFeedbackType {
            case .light:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            case .medium:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            case .heavy:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
            default:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            
        case .Selection:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }
}

enum HapticFeedbackTypes {
    case Notification
    case Impact
    case Selection
}

fileprivate func generateHapticFeedback(hapticFeedbackType: HapticFeedbackTypes, notificationFeedbackType: UINotificationFeedbackGenerator.FeedbackType? = nil, impactFeedbackType: UIImpactFeedbackGenerator.FeedbackStyle? = nil) {
    switch hapticFeedbackType {
    case .Notification:
        let generator = UINotificationFeedbackGenerator()
        switch notificationFeedbackType {
        case .error:
            generator.notificationOccurred(.error)
        case .success:
            generator.notificationOccurred(.success)
        case .warning:
            generator.notificationOccurred(.warning)
        default:
            generator.notificationOccurred(.success)
        }
        
    case .Impact:
        switch impactFeedbackType {
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        default:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
    case .Selection:
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
