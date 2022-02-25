//
//  GridCell.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/26.
//

import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // View Controller에서 Cell의 데이터를 업데이트 하지 않고,
    // Cell에서 업데이트 하도록 메서드를 구현한다.
    func updateCell(data: BountyInfo) {
        imgView.image = data.image
        nameLabel.text = data.name
        bountyLabel.text = "\(data.bounty)"
    }
}
