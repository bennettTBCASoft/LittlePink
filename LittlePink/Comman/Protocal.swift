//
//  Protocal.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/28.
//

import Foundation

protocol ChannelVCDelegate {
    
    /// 用戶從選擇畫題頁面返回編輯筆記頁面傳值用
    /// - parameter channel: 傳回來的 channel
    /// - parameter subChennel: 傳回來的 subChennel
    func updateChannel( channel: String, subChannel: String)
}
