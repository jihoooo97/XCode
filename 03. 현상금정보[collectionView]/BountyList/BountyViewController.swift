import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let viewControl = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                viewControl?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // UICollectionViewDataSource
    // 몇개를 보여줄지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.bountyInfoListCount
    }
    // 셀을 어떻게 표현할지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UICollectionViewDelegate
    // 셀이 클릭됐을 때 어떻게 할지
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // UICollectionViewDelegateFlowLayout
    // 셀 size를 계산 (여러 기기에서 일관된 디자인을 보여주기 위함)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10 / 7 + textAreaHeight
        return CGSize(width: width, height: height)
        
    }
    
}


class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
