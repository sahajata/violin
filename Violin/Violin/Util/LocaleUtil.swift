//
//  LocaleUtil.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/26.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation

public class LocaleUtil {
    
    public static func getCurrent() -> String {
        let currentLanguage: String = Locale.preferredLanguages[0]
        if (currentLanguage.starts(with: "zh-Hans")) { // 简体中文
            return "zh-CN"
        } else if (currentLanguage.starts(with: "zh-Hant")) { // 繁体中文
            return "zh-TW"
        } else if (currentLanguage.starts(with: "en")) {
            return "en"
        }
        return currentLanguage
    }
}
