import UIKit

class MenuAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    let present: Bool
    
    init(present: Bool = true) {
        self.present = present
    }
    
    let duration: TimeInterval = 0.2
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    let cornerRadius: CGFloat = 36
    let offset: CGFloat = 80
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if present {
            let fromView = transitionContext.viewController(forKey: .from)!.view!
            let toView = transitionContext.view(forKey: .to)!
            
            // to
            containerView.addSubview(toView)
            toView.translatesAutoresizingMaskIntoConstraints = false
            toView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            toView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
            toView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -offset).isActive = true
            
            // from
            let shadowView = UIView(frame: containerView.frame)
            let dismissOverlay = UIControl(frame: containerView.frame)
            dismissOverlay.addTarget(transitionContext.viewController(forKey: .to), action: #selector(UIViewController.dismissMenu), for: .touchUpInside)
            containerView.addSubview(shadowView)
            containerView.addSubview(fromView)
            containerView.addSubview(dismissOverlay)
            containerView.backgroundColor = UIColor.systemBackground
            fromView.clipsToBounds = true
            fromView.layer.cornerRadius = cornerRadius
            shadowView.backgroundColor = UIColor.systemBackground
            shadowView.layer.cornerRadius = cornerRadius
            shadowView.layer.shadowOffset = .init(width: -3, height: 0)
            shadowView.layer.shadowOpacity = 0.5
            
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
                let transform = CGAffineTransform(scaleX: 0.95, y: 0.95).concatenating(CGAffineTransform(translationX: containerView.frame.width - self.offset, y: 0))
                fromView.transform = transform
                shadowView.transform = transform
                dismissOverlay.transform = transform
            }) { (completed) in
                transitionContext.completeTransition(completed)
            }
        } else {
            let fromView = transitionContext.view(forKey: .from)!
            let toView = transitionContext.viewController(forKey: .to)!.view!
            
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
                // from
                containerView.subviews.forEach { (view) in
                    view.transform = .identity
                }
            }) { (completed) in
                toView.layer.cornerRadius = 0
                fromView.removeFromSuperview()
                
                containerView.superview?.addSubview(toView)
                transitionContext.completeTransition(completed)
            }
        }
    }
    
}

extension UIViewController {
    @objc func dismissMenu() {
        dismiss(animated: true)
    }
}

