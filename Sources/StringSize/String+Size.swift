
import Foundation

#if canImport(UIKit)

import UIKit

extension String {
  public func size(OfFont font: UIFont) -> CGSize {
    return self.size(withAttributes: [NSAttributedString.Key.font: font])
  }
}

extension String {
  public func boundingRect(with size: CGSize, attributes: [NSAttributedString.Key: Any]?) -> CGRect {
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let rect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
    return snap(rect)
  }
  
  public func size(thatFits size: CGSize, font: UIFont, maximumNumberOfLines: Int = 0) -> CGSize {
    var size = self.boundingRect(with: size, attributes: [.font: font]).size
    if maximumNumberOfLines > 0 {
      size.height = min(size.height, CGFloat(maximumNumberOfLines) * font.lineHeight)
    }
    return snap(size)
  }
}

/// Ceil to snap pixel
private func snap(_ x: CGFloat) -> CGFloat {
  let scale = UIScreen.main.scale
  return ceil(x * scale) / scale
}

private func snap(_ point: CGPoint) -> CGPoint {
  return CGPoint(x: snap(point.x), y: snap(point.y))
}

private func snap(_ size: CGSize) -> CGSize {
  return CGSize(width: snap(size.width), height: snap(size.height))
}

private func snap(_ rect: CGRect) -> CGRect {
  return CGRect(origin: snap(rect.origin), size: snap(rect.size))
}

#endif

