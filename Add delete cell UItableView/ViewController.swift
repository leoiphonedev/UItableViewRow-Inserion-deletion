//
//  ViewController.swift
//  Add delete cell UItableView
//
//  Created by Aman Aggarwal on 25/05/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblList:UITableView!
    var names = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.dataSource = self
        tblList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if let lbl = cell?.contentView.viewWithTag(101) as? UILabel {
            lbl.text = names[indexPath.row]
        }
        
        if let btnDelete = cell?.contentView.viewWithTag(102) as? UIButton {
            btnDelete.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        }
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96.0
    }
    
    @IBAction func addRow(_ sender: UIButton) {
        names.insert("New Name", at: 0)
        tblList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
    }

    @objc func deleteRow(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tblList)
        guard let indexPath = tblList.indexPathForRow(at: point) else {
            return
        }
        names.remove(at: indexPath.row)
        tblList.deleteRows(at: [indexPath], with: .left)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

