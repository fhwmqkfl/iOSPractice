//
//  Entity.swift
//  MVVMEX2
//
//  Created by coco on 2023/10/20.
//

import Foundation

// MARK: - UTCTimeModel
struct UtcTimeModel: Codable {
    let abbreviation, clientIP, currentDateTime: String
    let dayOfWeek, dayOfYear: Int
    let dst: Bool
    let dstFrom = "test"
    let dstOffset: Int
    let dstUntil = "test"
    let rawOffset: Int
    let timezone: String
    let unixtime: Int
    let utcDatetime, utcOffset: String
    let weekNumber: Int

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case clientIP = "client_ip"
        case currentDateTime = "datetime"
        case dayOfWeek = "day_of_week"
        case dayOfYear = "day_of_year"
        case dst
        case dstFrom = "dst_from"
        case dstOffset = "dst_offset"
        case dstUntil = "dst_until"
        case rawOffset = "raw_offset"
        case timezone, unixtime
        case utcDatetime = "utc_datetime"
        case utcOffset = "utc_offset"
        case weekNumber = "week_number"
    }
}
