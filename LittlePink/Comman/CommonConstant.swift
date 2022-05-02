//
//  Common.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/17.
//

import UIKit


// MARK: - StoryboardID
let kFollowVCID = "FollowVCID"
let kDiscoverVCID = "DiscoverVCID"
let kNearByVCID = "NearByVCID"
let kWaterfallVCID = "WaterfallVCID"
let kNoteEditVCID = "NoteEditVCID"
let kChannelTableVCID = "ChannelTableVCID"

// MARK: - Cell相關ID
let waterfallId = "WaterFallID"
let photoCellId = "PhotoCellID"
let photoFooterId = "PhotoFooterID"
let subChannelCellID = "SubChannelCellID"
let draftNoteCellID = "DraftNoteCellID"

// MARK: 資源相關
let mainColor = UIColor(named: "main")!
let imagePH = UIImage(named: "imagePH")

// MARK: CoreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

// MARK: 業務邏輯相關
// 瀑布流
let kWaterfallPadding:CGFloat = 4

let kChannels = ["推薦", "旅行", "娛樂", "才藝", "美妝", "白富美", "美食", "萌寵"]
let kAllSubChannels = [
    ["穿神马是神马", "就快瘦到50斤啦", "花5个小时修的靓图", "网红店入坑记"],
    ["魔都名媛会会长", "爬行西藏", "无边泳池只要9块9"],
    ["小鲜肉的魔幻剧", "国产动画雄起"],
    ["练舞20年", "还在玩小提琴吗,我已经尤克里里了哦", "巴西柔术", "听说拳击能减肥", "乖乖交智商税吧"],
    ["粉底没有最厚,只有更厚", "最近很火的法属xx岛的面霜"],
    ["我是白富美你是吗", "康一康瞧一瞧啦"],
    ["装x西餐厅", "网红店打卡"],
    ["我的猫儿子", "我的猫女儿", "我的兔兔"]
]


// YPImagePicker
let kMaxCameraZoomFactor: CGFloat = 5
let kMaxPhotoCount = 9
let kSpacingBetweenItem: CGFloat = 2

// NoteEdit Title 字數限制
let kMaxNoteTitleCount = 20
let kMaxNoteTextCount = 1000

