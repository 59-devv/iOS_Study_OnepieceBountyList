//
//  BountyViewController.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/18.
//

import UIKit

class BountyViewController: UIViewController {
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [3300000, 50, 4400000, 300000000, 1600000, 8000000, 7700000, 120000000]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// UITableViewDataSource
// : 몇 개 보여줄 것인가, 어떻게 보여줄 것인가를 커스텀으로 정의해준다.
// : 위 두 가지는 필수적으로 정의를 해주어야 한다.
extension BountyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCustomCell else {
            return UITableViewCell()
        }
        
        let image = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = image
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        cell.nameLabel.text = nameList[indexPath.row]
        
        return cell
    }
}

// UITableViewDelegate
// : 클릭했을 때 어떻게 할 것인가를 정의해준다.
extension BountyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------> 현재 번호: \(indexPath.row)")
        // withIdentifier에 설정한 Segue Identifier 이름을 넣어준다.
        // sender는 Segue를 수행하는데 있어서 특정 Object를 함께 보낼 수 있는데,
        // 현재는 nil로 설정하면 된다.
        performSegue(withIdentifier: "showDetailModally", sender: nil)
    }
}


