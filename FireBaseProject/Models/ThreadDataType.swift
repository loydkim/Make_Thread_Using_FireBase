//
//  ThreadData.swift
//  FireBaseProject
//
//  Created by YOUNGSIC KIM on 2019-12-29.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import Foundation
import SwiftUI

let userRandomImageArray = ["moon.circle.fill","star.circle.fill","bolt.circle.fill","icloud.circle.fill","tv.circle.fill","bolt.horizontal.circle.fill","asterisk.circle.fill","folder.circle.fill","book.circle.fill"]
let randomColorStringArray1 = [ForegroundColor.redColor,ForegroundColor.blueColor,ForegroundColor.orangeColor,ForegroundColor.blackColor,ForegroundColor.greenColor,ForegroundColor.purpleColor]

struct ThreadDataType: Identifiable {
    var id: String
    var userID: String
    var userImage: String
    var imageColor: Color
    var content: String
    var date:String
}

enum ForegroundColor:String {
    case redColor, blueColor, orangeColor, blackColor, greenColor, purpleColor
}

func stringToColor(colorString: String) -> Color {
    var returnColor:Color = Color.blue
    switch colorString {
        case "redColor": returnColor = Color.red
        case "blueColor": returnColor = Color.blue
        case "orangeColor": returnColor = Color.orange
        case "blackColor": returnColor = Color.black
        case "greenColor": returnColor = Color.green
        case "purpleColor": returnColor = Color.purple
    default:
        returnColor = Color.black
    }
    return returnColor
}

func makeToday() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy MMM dd h:mm a"
    return formatter.string(from: date)
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

let threadDataTest = [ThreadDataType(id: "id1",userID:randomString(length: 10),userImage:userRandomImageArray.randomElement()!, imageColor:Color.black, content: "content1", date:makeToday())]
