//
//  BaseTVCell.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import Foundation
import SnapKit

class BaseTVCell: UITableViewCell {
    
    var isLoaded = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        if !isLoaded {
            isLoaded = true
            
            addSubViews()
            setupUI()
            onViewLoaded()
        }
    }
    
    open func onViewLoaded() {
    }
    
    open func addSubViews() {
    }
    
    open func setupUI() {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutMargins = UIEdgeInsets.zero
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
}
