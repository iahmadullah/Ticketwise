import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor((borderColor ?? UIColor.clear).cgColor)
        context.setLineWidth(lineWidth)
        
        let y = rect.maxY - lineWidth / 2
        context.move(to: .init(x: rect.minX, y: y))
        context.addLine(to: .init(x: rect.maxX, y: y))
        context.strokePath()
        super.draw(rect)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }

}
