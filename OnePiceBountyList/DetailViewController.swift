//
//  DetailViewController.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/18.
//

import UIKit

class DetailViewController: UIViewController {

    // MVVM 찾기
    // 1. Model
    //   - 데이터를 구성할 BountyInfo 만들기
    // 2. View
    //   - imgView, nameLabel, bountyLabel
    //   - view들의 정보는 viewModel에서 받아서 구성된다.
    // 3. ViewModel
    //   - ViewModel을 만들어서, 데이터 전달 (Model을 가지고 있어야 함)
    //   - View Layer에서 필요한 메서드 만들기
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = self.bountyInfo {
            let image = UIImage(named: "\(bountyInfo.name).jpg")
            imageView.image = image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//
//        if let name = self.name, let bounty = self.bounty {
//            let image = UIImage(named: "\(name).jpg")
//            imageView.image = image
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        // dismiss는 사라지게 하는 것을 의미한다.
        // 사라진 후, 동작하게 될 것들을 정의해줄 수 있다.
        dismiss(animated: true, completion: nil)
    }
}
