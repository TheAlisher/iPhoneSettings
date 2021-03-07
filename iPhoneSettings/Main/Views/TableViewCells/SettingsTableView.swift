//
//  SettingsTableViewCell.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import Foundation
import SnapKit

protocol SettingsTableViewDelegate: class {
    func clickColorSettings()
}

class SettingsTableViewCell: BaseTVCell {
    
    private var item: SettingsItem?
    private var delegate: SettingsTableViewDelegate?
    
    private lazy var icon: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickIcon)))
        return view
    }()
    
    private lazy var labelText: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = view.font.withSize(18)
        return view
    }()
    
    private lazy var iconArrowRight: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func addSubViews() {
        contentView.addSubview(icon)
        addSubview(labelText)
        addSubview(iconArrowRight)
    }
    
    override func setupUI() {
        icon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
            make.left.equalToSuperview().inset(20)
        }
        
        labelText.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(icon.snp.right).offset(20)
        }
        
        iconArrowRight.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(10)
        }
    }
    
    func fill(_ item: SettingsItem,_ delegate: SettingsTableViewDelegate) {
        self.item = item
        self.delegate = delegate
        
        icon.backgroundColor = item.color
        labelText.text = item.title
    }
    
    func updateColor(_ color: UIColor) {
        icon.backgroundColor = color
    }
    
    @objc func clickIcon() {
        if let delegate = self.delegate {
            delegate.clickColorSettings()
        }
    }
}
