//
//  ViewController.swift
//  TableView-Alert
//
//  Created by 木元健太郎 on 2021/06/05.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    
    private var texts:[Model] = []
    private var heightCache: [CGFloat] = []
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    @IBAction func addButtun(_ sender: Any) {
        
        var textField = UITextField()

                let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)

                let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
                    // 「リストに追加」を押された時に実行される処理

                    let newItem: Model = Model(text: textField.text!)

                    // アイテム追加処理
                    self.texts.append(newItem)
                    self.tableView.reloadData()

                }

                alert.addTextField { (alertTextField) in
                    alertTextField.placeholder = "新しいアイテム"
                    textField = alertTextField
                }

                alert.addAction(action)
                present(alert, animated: true, completion: nil)
        
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


extension FirstViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
              return UITableViewCell()
            }
        let user = texts[indexPath.row]
        cell.textLabel?.text = user.text
            cell.configure(user: user)
            return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        texts.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}

extension FirstViewController:UITableViewDelegate {
    
    
}
