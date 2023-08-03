//
//  DetailViewController.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/3/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var request: Request!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = request.name
        
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "AppetizerDetailCell", bundle: .main), forCellReuseIdentifier: "AppetizerDetailCell")
    }
}

// MARK: - TableViewDataSource
extension DetailViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppetizerDetailCell", for: indexPath) as? AppetizerDetailCell else {
            return UITableViewCell()
        }
        cell.config(appetizerModel: request)
        return cell
    }
}
