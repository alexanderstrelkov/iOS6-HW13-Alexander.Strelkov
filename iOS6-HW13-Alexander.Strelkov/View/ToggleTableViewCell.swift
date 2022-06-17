//
//  ToggleTableViewCell.swift
//  iOS6-HW13-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 01.06.2022.
//

import UIKit

class ToggleTableViewCell: UITableViewCell {
    
    static let identifier = "ToggleTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = .systemBlue
        return toggle
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(toggle)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
        toggle.sizeToFit()
        toggle.frame = CGRect(
            x: (contentView.frame.size.width - toggle.frame.size.width) - 20,
            y: (contentView.frame.size.height - toggle.frame.size.height)/2,
            width: toggle.frame.size.width,
            height: toggle.frame.size.height)
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        toggle.isOn = false
    }
    
    public func configureCustomCell(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconColor
        toggle.isOn = model.isToggled
    }
}
