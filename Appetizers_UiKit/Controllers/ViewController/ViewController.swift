//
//  ViewController.swift
//  Appetizers_UiKit
//
//  Created by Asif Khan on 8/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    var appetizerViewModel = AppetizerViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Appetizers"
        
        appetizerViewModel.getResponse()
        appetizerViewModel.getDataSuccessfully = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "AppetizerCell", bundle: .main), forCellReuseIdentifier: "AppetizerCell")
    }
}
// MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appetizerViewModel.appetizerModel?.request.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppetizerCell", for: indexPath) as? AppetizerCell else {
            return UITableViewCell()
        }
        if let appetizerModel = appetizerViewModel.appetizerModel?.request[indexPath.row] {
            cell.config(appetizerModel: appetizerModel)
        }
        return cell
    }
}

// MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        guard let request = appetizerViewModel.appetizerModel?.request[indexPath.row]  else {
            return
        }
        vc.request = request
        navigationController?.pushViewController(vc, animated: true)
    }
}
