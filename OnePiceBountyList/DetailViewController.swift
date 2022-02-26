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
    
    // 애니메이션을 적용하기 위해 Constraint를 가져온다.
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
//    var name: String?
//    var bounty: Int?
    
//    var bountyInfo: BountyInfo?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // 애니메이션 준비
        prepareAnimation2()
    }
    
    // 뷰가 뜬 다음에 실행할 것
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 애니메이션 실행
        showAnimation2()
    }
    
    // 뷰 속성을 이용한 애니메이션 구현
    private func prepareAnimation2() {
        // 우측 화면밖에서 가운데로 이동하고, 크기도 컸다가 작아진다. 그리고, 회전하면서 들어온다.
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
            .scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
            .scaledBy(x: 3, y: 3).rotated(by: 180)
        
        // 투명하게 만들어준다.
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    // 뷰 속성을 이용한 애니메이션 구현
    private func showAnimation2() {
        
        // nameLabel 애니메이션 주기
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            // Label에 변형을 가하기 전, 원래 형태
            self.nameLabel.transform = CGAffineTransform.identity
            // 투명하게 만들었던 것을, 원래대로 돌려놓는다.
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        // nameLabel 이후에, bounty Label 애니메이션 주기
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            // Label에 변형을 가하기 전, 원래 형태
            self.bountyLabel.transform = CGAffineTransform.identity
            // 투명하게 만들었던 것을, 원래대로 돌려놓는다.
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        // 이미지 회전시키기
        UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    
    // 제약을 이용한 애니메이션 구현
    private func prepareAnimation() {
        // 화면 밖으로 nameLabel을 내보내준다.
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
    }
    
    // 제약을 이용한 애니메이션 구현
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
        // 기본 애니메이션
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
////
        // 애니메이션 옵션 추가
//        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        // 스프링 반동효과
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {self.view.layoutIfNeeded()}, completion: nil)
        
        // 이미지 회전시키기
        UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imageView.image = bountyInfo.image
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

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func updateData(data: BountyInfo?) {
        bountyInfo = data
    }
}
