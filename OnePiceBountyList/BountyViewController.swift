//
//  BountyViewController.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/18.
//

import UIKit

class BountyViewController: UIViewController {

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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

// UITableViewDelegate
// : 클릭했을 때 어떻게 할 것인가를 정의해준다.
extension BountyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------> 현재 번호: \(indexPath.row)")
    }
}
