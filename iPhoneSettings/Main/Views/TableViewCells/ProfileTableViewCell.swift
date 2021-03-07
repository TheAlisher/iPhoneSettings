//
//  ProfileTableViewCell.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import Foundation
import SnapKit

protocol ProfileTableViewCellDelegate: class {
    func clickColorProfile()
}

class ProfileTableViewCell: BaseTVCell {
    
    private var item: SettingsItem?
    private weak var delegate: ProfileTableViewCellDelegate?
    
    private lazy var imageProfile: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 30
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickImage)))
        return view
    }()
    
    private lazy var labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .blue
        view.font = view.font.withSize(18)
        return view
    }()
    
    private lazy var labelDescription: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.font = view.font.withSize(16)
        return view
    }()
    
    override func addSubViews() {
        contentView.addSubview(imageProfile)
        addSubview(labelTitle)
        addSubview(labelDescription)
    }
    
    override func setupUI() {
        imageProfile.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(60)
            make.left.equalToSuperview().offset(20)
        }
        
        labelTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageProfile.snp.right).offset(10)
            make.right.equalToSuperview()
        }
        
        labelDescription.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom)
            make.left.equalTo(imageProfile.snp.right).offset(10)
            make.right.equalToSuperview()
        }
    }
    
    func fill(_ item: SettingsItem,_ delegate: ProfileTableViewCellDelegate) {
        self.item = item
        self.delegate = delegate
        
        imageProfile.backgroundColor = item.color
        labelTitle.text = item.title
        labelDescription.text = item.subtitle
    }
    
    func updateColor(_ color: UIColor) {
        imageProfile.backgroundColor = color
    }
    
    @objc func clickImage(_ sender: UIImageView) {
        if let delegate = self.delegate {
            delegate.clickColorProfile()
        }
    }
}
