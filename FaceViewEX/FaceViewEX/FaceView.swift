//
//  FaceView.swift
//  FaceViewEX
//
//  Created by coco on 2023/10/10.
//

import UIKit

@IBDesignable
class FaceView: UIView {
    enum Eye {
        case Left
        case Right
    }
    @IBInspectable
    var scale: CGFloat = 0.90 { didSet { setNeedsDisplay() } }
    @IBInspectable
    var mouthCurvature: Double = 1.0 { didSet { setNeedsDisplay() } } // 1 full smile, -1 full frown
    @IBInspectable
    var eyesOpen: Bool = false { didSet { setNeedsDisplay() } }
    @IBInspectable
    var eyeBrowTilt: Double = -0.5 { didSet { setNeedsDisplay() } } // 1 full furrow, 1 fully relaxed
    @IBInspectable
    var color: UIColor = UIColor.blue { didSet { setNeedsDisplay() } }
    @IBInspectable
    var lineWidth: CGFloat = 5.0 { didSet { setNeedsDisplay() } }
    
    private var skullRadious: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2
    }
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    // 눈을 만들기위해 두개골의 반경과
    private struct Ratios {
        static let SkullRadiousToEyeOffset: CGFloat = 3
        static let SkullRadiousToEyeRadius: CGFloat = 10
        static let SkullRadiousToMouthWidth: CGFloat = 1
        static let SkullRadiousToMouthHeight: CGFloat = 3
        static let SkullRadiousToMouthOffset: CGFloat = 3
        static let skullRadiousToBrowOffset: CGFloat = 5
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadious).stroke() // 여기까지한걸 그림
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
        pathForMouth().stroke()
        pathForBrow(.Left).stroke()
        pathForBrow(.Right).stroke()
    }
    
    private func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: radius, startAngle: 0.0, endAngle: 2*Double.pi, clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    private func getEyeCenter(_ eye: Eye) -> CGPoint {
        let eyeOffset = skullRadious / Ratios.SkullRadiousToEyeOffset
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left: eyeCenter.x -= eyeOffset
        case .Right: eyeCenter.x += eyeOffset
        }
        
        return eyeCenter
    }
    
    private func pathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = skullRadious / Ratios.SkullRadiousToEyeRadius
        let eyeCenter = getEyeCenter(eye)
        
        if eyesOpen {
            return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
        } else {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
            path.lineWidth = lineWidth
            
            return path
        }
    }
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth = skullRadious / Ratios.SkullRadiousToMouthWidth
        let mouthHeight = skullRadious / Ratios.SkullRadiousToMouthHeight
        let mouthOffset = skullRadious / Ratios.SkullRadiousToMouthOffset
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth/2, y: skullCenter.y + mouthOffset, width: mouthWidth, height: mouthHeight)
        
        let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY)
        let cp1 = CGPoint(x: mouthRect.minX + mouthRect.width / 3, y: mouthRect.minY + smileOffset)
        let cp2 = CGPoint(x: mouthRect.maxX - mouthRect.width / 3, y: mouthRect.minY + smileOffset)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWidth
        
        return path
    }
    
    private func pathForBrow(_ eye: Eye) -> UIBezierPath {
        var tilt = eyeBrowTilt
        
        switch eye {
        case .Left: tilt *= -1.0
        case .Right: break
        }
        
        var browCenter = getEyeCenter(eye)
        browCenter.y -= skullRadious / Ratios.skullRadiousToBrowOffset
        let eyeRadius = skullRadious / Ratios.SkullRadiousToEyeRadius
        let tiltOffset = CGFloat(max(-1, min(tilt, 1))) * eyeRadius / 2
        let browStart = CGPoint(x: browCenter.x - eyeRadius, y: browCenter.y - tiltOffset)
        let browEnd = CGPoint(x: browCenter.x + eyeRadius, y: browCenter.y + tiltOffset)
        let path = UIBezierPath()
        path.move(to: browStart)
        path.addLine(to: browEnd)
        path.lineWidth = lineWidth
        
        return path
    }
    
}
