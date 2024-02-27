//
//  LanguageTableViewCell.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 07/02/2024.
//

import UIKit
import SnapKit

class LanguageTableViewCell: UITableViewCell {

    let identifier = "LanguageCell"
    //MARK: languageLabel
    let languageLabel = {
        let label = UILabel()
        label.text = "Қазақша"
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        label.textColor = UIColor(named: "111827 - FFFFFF")
        
        return label
    }()
    //MARK: checkImage
    let checkImage = {
        let image = UIImageView()
        image.image = UIImage(named: "check")
        
        return image
    }()
    //MARK: grayView
    let grayView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: setupUI
    func setupUI() {
        contentView.backgroundColor = UIColor(named: "FFFFFF - 111827")
        contentView.addSubview(languageLabel)
        contentView.addSubview(checkImage)
        contentView.addSubview(grayView)
        //contentView.addSubviews(languageLabel, checkImage, grayView)
        
        languageLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        checkImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        grayView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
