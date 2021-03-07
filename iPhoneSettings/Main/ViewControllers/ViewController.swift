//
//  ViewController.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var viewModel: ViewModel = {
        return ViewModel(delegate: self)
    }()
    
    private lazy var tableview: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.cellID)
        view.register(SpaceTableViewCell.self, forCellReuseIdentifier: SpaceTableViewCell.cellID)
        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.cellID)
        view.tableFooterView = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeArea.top)
            make.bottom.equalTo(self.view.safeArea.bottom)
        }
        
        viewModel.loadData()
    }
}

extension ViewController: ViewModelDelegate {
    func reloadTableView() {
        self.tableview.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.datalist[indexPath.row]
        
        switch item.type {
        
        case .Profile:
            return 80
        
        case .Settings, .Space:
            return 44
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")

        
        
        self.tableview.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.datalist[indexPath.row]
        
        switch item.type {
        
        case .Profile:
            let cell = tableview.dequeueReusableCell(
                withIdentifier: ProfileTableViewCell.cellID, for: indexPath
            ) as! ProfileTableViewCell
            cell.fill(item, self)
            cell.selectionStyle = .gray
            
            return cell
            
        case .Space:
            let cell = tableview.dequeueReusableCell(
                withIdentifier: SpaceTableViewCell.cellID, for: indexPath
            ) as! SpaceTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case .Settings:
            let cell = tableview.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.cellID, for: indexPath
            ) as! SettingsTableViewCell
            cell.fill(item, self)
            cell.selectionStyle = .gray
            
            return cell
            
        }
    }
}

extension ViewController: ProfileTableViewCellDelegate {
    func clickColorProfile() {
        
    }
}

extension ViewController: SettingsTableViewDelegate {
    func clickColorSettings() {
        
    }
}
