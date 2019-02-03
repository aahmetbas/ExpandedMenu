//
//  MenuController.swift
//  ExpandedMenu
//
//  Created by Alperen Ahmet Baş on 15.01.2019.
//  Copyright © 2019 Alperen Ahmet Baş. All rights reserved.
//

import UIKit

public class MenuController: NSObject, UITableViewDelegate, UITableViewDataSource{
    var menuArray:[MenuItem] = []
    var logo:UIImage!
    var title:String = ""
    var selectedIndexPath : IndexPath?
    let cellHeight = 40
    let bottomCellHeight = 50
    let cornerRadius = 5
    let cellPaddingY:Int = 5
    let selectedCellPaddingY:Int = 15
    
    init(menuArray: [MenuItem]) {
        self.menuArray = menuArray
    }
    
    init(menuArray: [MenuItem], logo:UIImage, title:String) {
        self.menuArray = menuArray
        self.title = title
        self.logo = logo
    }
    
    var didSelectRow: ((_ selectedRow: Int) -> Void)?
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count + 1
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(selectedIndexPath == nil){
            if(indexPath.row == 0){
                let tempHeight = CGFloat(Int(tableView.frame.height) - Int(cellHeight * menuArray.count)
                    - (bottomCellHeight - cellHeight) - cellPaddingY)
                if(299 < tempHeight){
                    return CGFloat(Int(tableView.frame.height) - Int(cellHeight * menuArray.count)
                        - (bottomCellHeight - cellHeight) - cellPaddingY)
                }else{
                    return 300
                }
            }else if(indexPath.row  == (menuArray.count)){
                return CGFloat(bottomCellHeight)
            }else{
                return CGFloat(cellHeight)
            }
        }else{
            if(indexPath.row == 0){
                let tempHeight = CGFloat(Int(tableView.frame.height) - Int(cellHeight * menuArray.count)
                    - (bottomCellHeight - cellHeight) - cellPaddingY)
                if(299 < tempHeight){
                    return CGFloat(Int(tableView.frame.height) - Int(cellHeight * menuArray.count)
                        - (bottomCellHeight - cellHeight) - cellPaddingY)
                }else{
                    return 300
                }
            }else{
                if(selectedIndexPath?.row == indexPath.row){
                    return (CGFloat(getHeight(view: menuArray[((selectedIndexPath?.row)! - 1)].view)) + CGFloat(bottomCellHeight + selectedCellPaddingY + selectedCellPaddingY))
                }else{
                    if((selectedIndexPath?.row)! < (indexPath.row)){
                        return checkNext(index: indexPath.row, selectedIndex: (selectedIndexPath?.row)!)
                    }else{
                        return checkPrevious(index: indexPath.row, selectedIndex: (selectedIndexPath?.row)!)
                    }
                }
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<IndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        
        if let didSelectRow = didSelectRow {
            didSelectRow(indexPath.row)
        }
        
        tableView.reloadData()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        if(indexPath.row != 0){
            if(selectedIndexPath?.row == indexPath.row){
                let back = RoundedView(frame: CGRect(x: 0, y: selectedCellPaddingY, width: Int(tableView.frame.width), height: (getHeight(view: menuArray[(selectedIndexPath?.row)! - 1].view) + cellHeight + selectedCellPaddingY)))
                
                back.backgroundColor = menuArray[indexPath.row - 1].backgrounColor
                back.cornerRadius = CGFloat(cornerRadius)
                back.shadow = 0.25
                
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: Int(tableView.frame.width - 20), height: cellHeight))
                label.text = menuArray[indexPath.row - 1].title
                label.font = label.font.withSize(18)
                label.textColor = menuArray[indexPath.row - 1].titleColor
                label.baselineAdjustment = .alignCenters
                back.addSubview(label)
                
                let userView = UIView(frame: CGRect(x: 0, y: cellHeight, width: Int(tableView.frame.width), height: getHeight(view: menuArray[(selectedIndexPath?.row)! - 1].view)))
                userView.addSubview(menuArray[(selectedIndexPath?.row)! - 1].view)
                back.addSubview(userView)
                
                cell.addSubview(back)
            }else{
                let back = RoundedView(frame: CGRect(x: 0, y: cellPaddingY, width: Int(tableView.frame.width),
                                                     height: (bottomCellHeight)))
                back.backgroundColor = menuArray[indexPath.row - 1].backgrounColor
                back.cornerRadius = CGFloat(cornerRadius)
                back.shadow = 0.25
                cell.addSubview(back)
                
                let label = UILabel(frame: CGRect(x: 10, y: cellPaddingY, width: Int(tableView.frame.width - 20), height: bottomCellHeight))
                label.text = menuArray[indexPath.row - 1].title
                label.font = label.font.withSize(18)
                label.textColor = menuArray[indexPath.row - 1].titleColor
                label.baselineAdjustment = .alignCenters
                cell.addSubview(label)
            }
        }else{
            let tempHeight = CGFloat(Int(tableView.frame.height) - Int(cellHeight * menuArray.count)
                             - (bottomCellHeight - cellHeight) - cellPaddingY)
            
            if(299 < tempHeight){
                let label = UILabel(frame: CGRect(x: 10, y: Int(tempHeight - 100), width: Int(tableView.frame.width - 20), height: 60))
                label.textAlignment = .center
                label.font = UIFont.boldSystemFont(ofSize: 24.0)
                label.textColor = UIColor.white
                label.text = title
                label.numberOfLines = 2
                
                cell.addSubview(label)
                
                let tempLogo = UIImageView(frame: CGRect(x: 10, y: 10, width: Int(tableView.frame.width - 20), height: Int(tempHeight - 110)))
                tempLogo.image = logo
                tempLogo.contentMode = .scaleAspectFit
                
                cell.addSubview(tempLogo)
            }else{
                let label = UILabel(frame: CGRect(x: 10, y: 200, width: Int(tableView.frame.width - 20), height: 60))
                label.textAlignment = .center
                label.font = label.font.withSize(24)
                label.textColor = UIColor.white
                label.text = title
                
                cell.addSubview(label)
                
                let tempLogo = UIImageView(frame: CGRect(x: 10, y: 10, width: Int(tableView.frame.width - 20), height: 190))
                tempLogo.image = logo
                tempLogo.contentMode = .scaleAspectFit
                
                cell.addSubview(tempLogo)
            }
        }
        
        cell.layer.anchorPointZ = CGFloat(indexPath.row) * (-1.0)
        cell.selectionStyle = .none
        return cell
    }
    
    private func checkPrevious(index:Int, selectedIndex:Int) -> CGFloat{
        var size:CGFloat = 0
        
        if((selectedIndex - index) == 1){
            size = CGFloat(bottomCellHeight)
        }else{
            size = CGFloat(cellHeight)
        }
        
        return size
    }
    
    private func checkNext(index:Int, selectedIndex:Int) -> CGFloat{
        var size:CGFloat = 0
        
        if( 1 <= (index - selectedIndex) && index != (menuArray.count)){
            size = CGFloat(cellHeight)
        }else{
            size = CGFloat(bottomCellHeight)
        }
        
        return size
    }
    
    private func getHeight(view:UIView) -> Int {
        return Int(view.frame.height)
    }
}
