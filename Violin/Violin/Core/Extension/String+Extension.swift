//
//  Strings.swift
//  Violin
//
//  Created by liuzhiyi on 2018/8/30.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation

public extension String {
    
    // MARK: 空字符串
    public static let EMPTY: String = ""
    
    // MARK: 逗号
    public static let COMMA: String = ","
    
    // MARK: 句点
    public static let DOT: String = "."
    
    // MARK: 下划线
    public static let UNDERLINE: String = "_"
    
    // MARK: 空格
    public static let SPACE: String = " "
    
    // MARK: 等于
    public static let EQUAL: String = "="
    
    // MARK: 星号
    public static let ASTERISK: String = "*"
    
    // MARK: 双引号
    public static let DOUBLE_QUOTES: String = "\""
    
    // MARK: 单引号
    public static let SINGLE_QUOTES: String = "'"
    
    // MARK: 回车符
    public static let ENTER: String = "\n"
    
    // MARK: 左括弧
    public static let LEFT_BRACKET: String = "{"
    
    // MARK: 右括弧
    public static let RIGHT_BRACKET: String = ")"

    // MARK: 冒号
    public static let COLON: String = ":"
    
    // MARK: 分号
    public static let SEMICOLON: String = ";"
    
    // MARK: 斜杠
    public static let SLASH: String = "/"
    
    // MARK: 反斜杠
    public static let BACKSLASH: String = "\\"
    
    // MARK: 百分号
    public static let PERCENT: String = "%"
    
    // MARK: 减号
    public static let MINUS: String = "-"
    
    // MARK: 加号
    public static let PLUS: String = "+"
    
    // MARK: 与号
    public static let AND: String = "&"
    
    // MARK: @
    public static let AT: String = "@"
    
    // MARK: 井号
    public static let WELL: String = "#"

    // MARK: 字符编码：UTF-8
    public static let ENCODING_UTF8: Encoding = String.Encoding.utf8
    
    // MARK: 默认字符编码
    public static let DEFAULT_ENCODING: Encoding = ENCODING_UTF8
    
    // MARK: 简体中文
    public static let LOCALE_SC: String = "zh_CN"
    
    // MARK: 繁体中文
    public static let LOCALE_TC: String = "zh_TW"
    
    // MARK: 英文
    public static let LOCALE_EN: String = "en"
    
    public func removeSpecialCharacters() -> String {
        let charact:CharacterSet = NSCharacterSet.whitespacesAndNewlines as CharacterSet
        var str = self
        let test = "\0"
        let more = test.substring(to: self.index(self.startIndex, offsetBy: 1))
        str = str.trimmingCharacters(in: charact)
        str = str.replacingOccurrences(of: String.SPACE, with: String.EMPTY)
        str = str.replacingOccurrences(of: String.ENTER, with: String.EMPTY)
        str = str.replacingOccurrences(of: more, with: String.EMPTY)
        return str
    }
    
}
