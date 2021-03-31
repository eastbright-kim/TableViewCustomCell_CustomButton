//
//  ViewController.swift
//  TableViewCustomCell_CustomButton
//
//  Created by 김동환 on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    var feedArray = [Feed(content: "simply dummy text of the printing and"),
                     Feed(content: "um has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type "),
                     Feed(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribestablished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
                     Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
                     Feed(content: "established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
                     Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
                     Feed(content: "a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is thaai"),
                     Feed(content: "ho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it is pai"),
                     Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simplho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it y because it is pai")]
    
    

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myTableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil)
        self.myTableView.register(nib, forCellReuseIdentifier: K.TABLE_VIEW_CELL_ID)
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 120
        self.myTableView.rowHeight = 300
        
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let feedCell = tableView.dequeueReusableCell(withIdentifier: K.TABLE_VIEW_CELL_ID) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let feed = self.feedArray[indexPath.row]
        
        feedCell.updateCell(with: feed)
        
        feedCell.heartBtnTapped = { isFavorite in
            
            self.feedArray[indexPath.row].isFavorite = isFavorite
            
        }
        
        return feedCell
    }
    
}
