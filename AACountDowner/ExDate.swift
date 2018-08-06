//
//  ExDate.swift
//  Tarabar
//
//  Created by Amir Ardalan on 4/30/18.
//  Copyright © 2018 Golrang. All rights reserved.
//

import Foundation
public extension Date
{
    
    public func convertToPersianWithTodayStr()->String{
        if Calendar.current.isDateInToday(self){
            return "امروز"
        }else if Calendar.current.isDateInYesterday(self){
            return "دیروز"
        }else{
            return self.convertToPersianDate()
        }
    }
    
    public func convertToPersianDate(formatString:String?="yyyy/MM/dd") -> String{
        let dateFormmater:DateFormatter = DateFormatter()
        dateFormmater.calendar = Calendar(identifier: Calendar.Identifier.persian)
        dateFormmater.locale = Locale(identifier: "fa_IR")
//        TODO: the server converts to UTC
//        dateFormmater.timeZone = TimeZone(identifier: "UTC")
        dateFormmater.dateFormat = formatString;
        return dateFormmater.string(from: self)
    }
    
    public func convertToServerFormat(formatString:String?="yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        return formatter.string(from: self)
    }
    
    public func  compareDaysWith(otherDate : Date )->Bool {
        
        let date1 = self
        let date2 = otherDate
        
        return Calendar.current.compare(date1, to: date2, toGranularity: .day) == .orderedSame
        
    }
    /// Returns the amount of years from another date
    public func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    public func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    public func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    public func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    public func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    public func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    public func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    public func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
 
}

extension String {
    public func convertToDate(formatString:String?="yyyy-MM-dd'T'HH:mm:ssZ") -> Date?
    {
        let dateFormmater:DateFormatter = DateFormatter()
        dateFormmater.dateFormat = formatString;
        guard let date = dateFormmater.date(from: self) else
        {
            dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ";
            return dateFormmater.date(from: self)
            
        }
        return date
    }
    
    public func convertToEnglishDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: self) else {return nil}
        return date
    }
}


