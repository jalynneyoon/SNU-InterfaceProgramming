//
//  Constants.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/18.
//

import Foundation
import UIKit

enum Constants {
    enum General {
        // 네이밍이 중요하다. 좋지 않은 이름은 하드코딩보다 나쁠수도.
        public static let strokeWidth = CGFloat(2.0)
        public static let roundedViewLength = CGFloat(56.0)
        public static let roundedRectViewWidth = CGFloat(68.0)
        public static let roundedRectViewHeight = CGFloat(56.0)
        public static let roundedRectCornerRadius = CGFloat(21.0)
        
    }
    
    enum Leaderboard {
        public static let leaderboardScoreColWidth = CGFloat(50.0)
        public static let leaderboardDateColWidth = CGFloat(170.0)
        public static let leaderboardMaxRowWidth = CGFloat(480.0)
    }
}
