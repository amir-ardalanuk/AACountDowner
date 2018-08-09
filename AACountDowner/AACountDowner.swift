//
//  AACountDowner.swift
//  ICRM-Customer
//
//  Created by Amir Ardalan on 3/18/18.
//  Copyright © 2018 Farhad. All rights reserved.
//
import UIKit
import Foundation
public class AACountDowner : UIView {
    @IBOutlet weak var container: UIView!{
        didSet{
            container.backgroundColor = .clear
        }
    }
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var dayTitle: UILabel!
    @IBOutlet weak var hourTitle: UILabel!
    @IBOutlet weak var minuteTitle: UILabel!
    @IBOutlet weak var secondsTitle: UILabel!
    
    public var font : UIFont? {
        didSet{
            guard let _font = font else {return }
           setFont(font: _font)
        }
    }
    
    public var isTitleVisible : Bool = true {
        didSet{
            dayTitle.isHidden = !isTitleVisible
            hourTitle.isHidden = !isTitleVisible
            minuteTitle.isHidden = !isTitleVisible
            secondsTitle.isHidden = !isTitleVisible
        }
    }
    
    @IBOutlet weak var secondStack: UIStackView!
    @IBOutlet weak var minuteStack: UIStackView!
    @IBOutlet weak var hourStack: UIStackView!
    @IBOutlet weak var dayStack: UIStackView!
    
    var timer : Timer?
    var d , h , m , s : Int!
    
    override public init(frame : CGRect){
        super.init(frame : frame)
        commit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commit()
    }
 
    
    public func commit(){
        let bundel = Bundle.init(for: AACountDowner.self)
        bundel.loadNibNamed("AACountDowner", owner: self, options: nil)
        addSubview(container)
        container.frame = self.bounds
        container.autoresizingMask = [.flexibleHeight , .flexibleWidth]
    }
    
    public func config(days : Int , hour : Int , minute : Int , second : Int , forceReload force : Bool = false){
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkDate), userInfo: nil, repeats: true)
            d = days
            h = hour
            m = minute
            s = second
            
            timer?.fire()
        }
        if force {
            d = days
            h = hour
            m = minute
            s = second
        }
    }
    
    public func config(withDate date: Date){
        guard date > Date() else {return }
        let day = Date().days(from: date)
        let minute = Date().minutes(from: date)
        let hour = Date().hours(from: date)
        let seconds = Date().seconds(from: date)
        config(days: day, hour: hour, minute: minute, second: seconds)
    }
    
    
    public func uiOption(haveShadow shadow: Bool = false , background : UIColor? , radius : CGFloat = 0 ){
        for i in mainStack.subviews {
            findCustomView(view: i) { (customView) in
                
                customView.layer.shadowColor = shadow ? UIColor.lightGray.cgColor : nil
                customView.layer.shadowRadius = shadow ? 12.0 : 0.0
                customView.layer.shadowOpacity = shadow ? 0.7 : 0.0
                
                customView.backgroundColor = background
                
                customView.layer.cornerRadius = radius
            }
        }
        
    }
    
    public func Visiblity(forDay day: Bool , hour : Bool , minute : Bool , seconds : Bool) {
        dayStack.isHidden = !day
        hourStack.isHidden = !hour
        minuteStack.isHidden = !minute
        secondStack.isHidden = !seconds
    }
    
    public func Titles(forDay day: String , hour : String , minute : String , seconds : String) {
        dayTitle.text = day
        hourTitle.text = hour
        minuteTitle.text = minute
        secondsTitle.text = seconds
    }
    
    func findLabel(view : UIView , cb : @escaping (_ label : UILabel)->Void){
        if view is UILabel {
            cb(view as! UILabel)
        }else if view.subviews.count > 0 {
            for i in view.subviews {
                findLabel(view: i, cb: cb)
            }
        }
    }
    
    func findCustomView(view : UIView , cb : @escaping (_ view : UIView)->Void){
        if view is CustomView {
            cb(view)
        }else if view.subviews.count > 0 {
            for i in view.subviews {
                findCustomView(view: i, cb: cb)
            }
        }
    }
    private func setFont(font : UIFont){
        for i in mainStack.subviews {
            findLabel(view: i) { (label) in
                label.font = font
            }
        }
    }
    
    func titleStyle(visible : Bool){
        
    }
    
    private func textStyle(number : Int)-> (Int , Int){
        return (Int(number / 10 ) , Int(number % 10))
    }
    
    @objc func checkDate(){
        s = s - 1
        guard s < 0 else {
            setDataOnComponent()
            return
        }
        s = 59
        m = m - 1
        guard m < 0 else{
            setDataOnComponent()
            return
        }
        m = 59
        h = h - 1
        guard h < 0 else{
            setDataOnComponent()
            return
        }
        h = 0
        d = d - 1
        if d < 0 {
            d = 0
        }
        setDataOnComponent()
        
    }
    private func setDataOnComponent(){
        for (index , key) in mainStack.subviews.enumerated() {
            guard let chStack = key.subviews[1] as? UIStackView else {return}
            switch index {
            case 0: setData(stack: chStack, number: d)
            case 1:  setData(stack: chStack, number: h)
            case 2:  setData(stack: chStack, number: m)
            case 3:  setData(stack: chStack, number: s)
            default:break
            }
        }
        
    }
    
    
    func setData(stack : UIStackView , number : Int){
        let style  = textStyle(number: number)
        let f = "\(style.0)"
        let s =  "\(style.1)"
        if  f != (stack.subviews[0].subviews[0] as! UILabel).text {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionFlipFromBottom], animations: {
                stack.subviews[0].transform = CGAffineTransform(scaleX: 1, y: 0.8).translatedBy(x:   0, y: 0)
            }, completion: { _ in
                (stack.subviews[0].subviews[0] as! UILabel).text = f
                stack.subviews[0].transform = CGAffineTransform.identity
            })
        }
        if  s != (stack.subviews[1].subviews[0] as! UILabel).text {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionFlipFromBottom], animations: {
                stack.subviews[1].transform = CGAffineTransform(scaleX: 1, y: 0.8).translatedBy(x:   0, y: 0)
                
            }, completion: { _ in
                (stack.subviews[1].subviews[0] as! UILabel).text = s
                stack.subviews[1].transform = CGAffineTransform.identity
            })
        }
        
        
    }
    
    
}


