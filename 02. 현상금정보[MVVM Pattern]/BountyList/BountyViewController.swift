import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bountyInfoListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
}


class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
