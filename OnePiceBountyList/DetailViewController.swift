//
//  DetailViewController.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let image = UIImage(named: "\(name).jpg")
            imageView.image = image
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        // dismiss는 사라지게 하는 것을 의미한다.
        // 사라진 후, 동작하게 될 것들을 정의해줄 수 있다.
        dismiss(animated: true, completion: nil)
    }
}
