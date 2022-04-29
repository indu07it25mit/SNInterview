//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: DashboardViewModel = DashboardViewModel(dependancyInjection: DependancyInjection.shared)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
    }
}

extension DashboardViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath) as? CoffeeitemCellView else { return UITableViewCell() }
        cell.update(viewModel.getCoffeeShop(at: indexPath.row))
        
        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {
    
}

extension DashboardViewController {
    func bindViewModel() {
        viewModel.update = { [weak self] (isSucess) in
            guard let strongSelf = self else { return }
            if isSucess {
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
            } else {
                strongSelf.showAlert()
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "SNInterview", message: viewModel.errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
