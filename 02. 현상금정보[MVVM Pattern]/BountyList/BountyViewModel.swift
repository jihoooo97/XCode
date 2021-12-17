import UIKit

class BountyViewModel {
    // cell에 보여줄 데이터
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4000000),
        BountyInfo(name: "luffy", bounty: 2000000),
        BountyInfo(name: "nami", bounty: 1600000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 666666),
        BountyInfo(name: "zoro", bounty: 1222222)
    ]
    var bountyInfoListCount: Int {
        return bountyInfoList.count
    }
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted {prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
