//
//  LoadView.swift
//  The Meal
//
//  Created by José Guilherme Bestel on 16/01/21.
//

import UIKit

class LoadView: UIView {

    static var shared = LoadView()
    fileprivate var backView: UIView?
    fileprivate var loadIndicator: UIActivityIndicatorView?
    private let TAG_BACKVIEW = 99
    
    func show(_ currentView : UIView) {
        DispatchQueue.main.async { [self] in
            //backview configuration
            backView = {
                let view = UIView()
                view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
                view.tag = TAG_BACKVIEW
                return view
            }()
            currentView.addSubview(self.backView!)
            //Constraints configuration
            backView?.translatesAutoresizingMaskIntoConstraints = false
            backView?.topAnchor.constraint(equalTo: currentView.topAnchor).isActive = true
            backView?.trailingAnchor.constraint(equalTo: currentView.trailingAnchor).isActive = true
            backView?.leadingAnchor.constraint(equalTo: currentView.leadingAnchor).isActive = true
            backView?.bottomAnchor.constraint(equalTo: currentView.bottomAnchor).isActive = true
            
            //LoadIndicatior configuration
            loadIndicator = {
               let load = UIActivityIndicatorView()
                load.style = .large
                load.startAnimating()
                load.color = .white
                return load
            }()
            backView?.addSubview(loadIndicator!)
            loadIndicator?.translatesAutoresizingMaskIntoConstraints = false
            loadIndicator?.centerYAnchor.constraint(equalTo: backView!.centerYAnchor).isActive = true
            loadIndicator?.centerXAnchor.constraint(equalTo: backView!.centerXAnchor).isActive = true
            self.backView!.isHidden = false
        }
    }
    
    func hide(){
        guard let backView = self.backView else { return }
        DispatchQueue.main.async {
            backView.isHidden = true
        }
    }
    
    init(){
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
}
