//
//  BountyViewController.swift
//  OnePiceBountyList
//
//  Created by 59 on 2022/02/18.
//

import UIKit

class BountyViewController: UIViewController {
    
    
    // MVVM 찾기
    // 1. Model
    //   - 데이터를 구성할 BountyInfo struct 만들기
    // 2. View
    //   - ListCell이 View 역할을 한다.
    //   - ListCell에서 필요한 정보를 ViewModel로부터 받도록 하기
    // 3. ViewModel
    //   - ViewModel을 만들어서, 데이터 전달 (Model을 가지고 있어야 함)
    //   - View Layer에서 필요한 메서드 만들기

    
    let viewModel = BountyViewModel()
    
//    Model로 만들어주었으므로, 아래는 주석처리함
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [3300000, 50, 4400000, 300000000, 1600000, 8000000, 7700000, 120000000]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 이 함수는 아래의 Delegate가 실행되고 나서, Modal을 띄우기 전에 준비하는 함수이다.
        // 따라서, Delegate에서 이 쪽으로 'sender'를 통해 데이터를 보내줄 수 있다.
        // 필요한 데이터는 'indexPath.row' 이므로, Delegate의 performSegue에서 sender로 설정해준다.
        
        // DetailViewController에게 데이터 전달해주기
        // 먼저 어떤 Segue에게 전달할지 설정해준다.
        if segue.identifier == "showDetailModally" {
            // segue의 목적지가 DetailViewController라는 것을 변수(vc)로 선언해주고,
            let vc = segue.destination as? DetailViewController
            // Delegate 에서 전달받은 sender를 Int로 다운캐스팅 한다.
            if let index = sender as? Int {
                // 미리 DetailViewController에 선언해놓은 name, bounty 변수에 각각 값을 할당해준다.
                // View Model 적용 후
                let bountyInfo = viewModel.bountyInfo(at: index)
                
                // View Model 적용 전
//                let bountyInfo = bountyInfoList[index]
                
                // View Model 적용 전
//                vc?.bountyInfo = bountyInfo
                
                // View Model 적용 후, 데이터를 Model로 보내기
                vc?.viewModel.updateData(data: bountyInfo)
                
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
            
        }
    }
    
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
        return viewModel.numOfBountyInfoList
//        return bountyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCustomCell else {
            return UITableViewCell()
        }
        // View Model 적용 후
        // 리팩토링 전
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.imgView.image = bountyInfo.image
//        cell.bountyLabel.text = "\(bountyInfo.bounty)"
//        cell.nameLabel.text = bountyInfo.name
        
        // 리팩토링을 통해 Cell에서 메서드를 호출하여 Cell 업데이트
        cell.updateCell(data: bountyInfo)
        
        // View Model 적용 전
//        let bountyInfo = bountyInfoList[indexPath.row]
//        let image = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = image
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//        cell.nameLabel.text = nameList[indexPath.row]

        return cell
    }
}

// UITableViewDelegate
// : 클릭했을 때 어떻게 할 것인가를 정의해준다.
extension BountyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------> 현재 번호: \(indexPath.row)")
        
        // withIdentifier에 설정한 Segue Identifier 이름을 넣어준다.
        // sender는 Segue를 수행하는데 있어서 특정 Object를 함께 보낼 수 있다.
        // Modal에 정보를 보내줘야 하므로, sender에 indexPath.row를 넣어 보내준다.
        // 여기서 보낸 정보는, 상단 'prepare' 함수로 전달된다.
        performSegue(withIdentifier: "showDetailModally", sender: indexPath.row)
    }
}

class BountyViewModel {
    // ViewModel은 Model 데이터를 가지고 있어야 한다.
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 3300000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4400000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 1600000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // 현상금이 높은 순서대로 정렬해주기
    var sortedBountyList: [BountyInfo] {
        bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
    }
    
    // 데이터가 몇개인지 반환
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    // 해당 인덱스에 있는 BountyInfo 찾기
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedBountyList[index]
    }
}
