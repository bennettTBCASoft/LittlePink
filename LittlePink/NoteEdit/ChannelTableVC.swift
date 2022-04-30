//
//  ChannelTableVC.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/28.
//

import UIKit
import XLPagerTabStrip


class ChannelTableVC: UITableViewController {

    var channel = ""
    var subChannels: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //把多餘分隔線去掉
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subChannels.count
    }
    
//    - (UxITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subChannelCellID, for: indexPath)
        
        cell.textLabel?.text = "# \(subChannels[indexPath.row])"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelVC = parent as! ChannelVC
        channelVC.PVDelegate?.updateChannel(channel: channel, subChannel: subChannels[indexPath.row])
        
        dismiss(animated: true)
    }

}

extension ChannelTableVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: channel)
    }
    
    
}
