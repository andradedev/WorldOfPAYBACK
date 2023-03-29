//
//  BaseViewController.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 25/03/23.
//

import SwiftUI

open class BaseSwiftUIViewController<T: View>: UIHostingController<T> {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var blur = UIVisualEffectView()
    var loadsView = UIView()
    
    public init(view: T) {
        super.init(rootView: view)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupBlur() {
        self.blur.effect = nil
        self.blur.layer.zPosition = 7
        self.blur.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(self.blur)
    }
    
    private func setupLoadingView() {
        self.loadsView.backgroundColor = UIColor.white
        self.loadsView.layer.cornerRadius = 10
        self.loadsView.frame = CGRect(x: 5, y: 5, width: 60, height: 60)
        self.loadsView.center = self.view.center
        self.loadsView.layer.zPosition = 10
        //prepare animation
        self.loadsView.alpha = 0
        self.loadsView.transform = CGAffineTransform(scaleX: 2, y: 2)
        
    }
    
    private func setupActivityIndicator() {
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.style = UIActivityIndicatorView.Style.medium
        self.activityIndicator.frame = CGRect(x: 5, y: 5, width: 50, height: 50)
        self.loadsView.addSubview(self.activityIndicator)
    }
    
    // UIKit loading pattern
    public func setLoading(_ activated: Bool) {
        if activated {
            setupBlur()
            setupLoadingView()
            setupActivityIndicator()
            self.view.addSubview(self.loadsView)
            UIView.animate(withDuration: 0.4, animations: {
                self.blur.effect = UIBlurEffect(style: .light)
                self.loadsView.alpha = 1
                self.loadsView.transform = CGAffineTransform.identity
            })
            self.activityIndicator.startAnimating()
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.blur.effect = nil
                self.loadsView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
                self.loadsView.alpha = 0
            }, completion: { (_) in
                self.activityIndicator.removeFromSuperview()
                self.blur.removeFromSuperview()
                self.blur = UIVisualEffectView()
                self.loadsView = UIView()
            })
        }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

open class BaseUIKitViewController: UIViewController {
    public init(isViewCode: Bool) {
        super.init(nibName: isViewCode ? nil : String(describing: type(of: self)),
                   bundle: Bundle(for: Self.self))
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
