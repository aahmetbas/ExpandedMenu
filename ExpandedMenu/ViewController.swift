//
//  ViewController.swift
//  ExpandedMenu
//
//  Created by Alperen Ahmet Baş on 29.01.2019.
//  Copyright © 2019 Alperen Ahmet Baş. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var menuController: MenuController?
    var menuArray:[MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu1 = MenuItem(title: "Menu Title 1", titleColor: UIColor.black, backgrounColor: UIColor.white, view: getMenu1())
        menuArray.append(menu1)
        
        let menu2 = MenuItem(title: "Menu Title 2", titleColor: UIColor.white, backgrounColor: UIColor.orange, view: getMenu2())
        menuArray.append(menu2)
        
        let menu3 = MenuItem(title: "Menu Title 3", titleColor: UIColor.black, backgrounColor: UIColor.white, view: getMenu3())
        menuArray.append(menu3)
        
        let menu4 = MenuItem(title: "Menu Title 4", titleColor: UIColor.white, backgrounColor: UIColor.orange, view: getMenu4())
        menuArray.append(menu4)
        
        menuController = MenuController(menuArray: menuArray, logo: UIImage(named: "github")!, title: "Expanded Menu")
        menuController?.didSelectRow = didSelectRow
        
        tableView.delegate = menuController
        tableView.dataSource = menuController
    }
    
    func didSelectRow(selectedRow: Int) {
        print(selectedRow)
    }
    
    private func getMenu1() -> UIView{
        let customvView = Bundle.main.loadNibNamed("Menu1", owner: self, options: nil)?.first as! Menu1
        customvView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: customvView.frame.height)
        
        customvView.label.text = "Menu 1 Text"
        customvView.topLeftButton.addTarget(self, action: #selector(topLeftButtonMenu1(sender:)), for: .touchUpInside)
        customvView.topRightButton.addTarget(self, action: #selector(topRightButtonMenu1(sender:)), for: .touchUpInside)
        customvView.bottomLeftButton.addTarget(self, action: #selector(bottomLeftButtonMenu1(sender:)), for: .touchUpInside)
        customvView.bottomRightButton.addTarget(self, action: #selector(bottomRightButtonMenu1(sender:)), for: .touchUpInside)
        
        return customvView
    }
    
    @objc func topLeftButtonMenu1(sender:UIButton){
        let alert = UIAlertController(title: "Message", message: "Top left button pressed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done",style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func topRightButtonMenu1(sender:UIButton){
        let alert = UIAlertController(title: "Message", message: "Top right button pressed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done",style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func bottomLeftButtonMenu1(sender:UIButton){
        let alert = UIAlertController(title: "Message", message: "Bottom left button pressed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done",style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func bottomRightButtonMenu1(sender:UIButton){
        let alert = UIAlertController(title: "Message", message: "Bottom right button pressed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done",style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getMenu2() -> UIView{
        let customvView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        customvView.backgroundColor = UIColor.orange
        
        return customvView
    }
    
    private func getMenu3() -> UIView{
        let customvView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        customvView.backgroundColor = UIColor.white
        
        return customvView
    }
    
    private func getMenu4() -> UIView{
        let customvView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 350))
        customvView.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 0, y: 160, width: view.frame.width, height: 30))
        label.text = "Test Message"
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        customvView.addSubview(label)
        
        return customvView
    }
}
