//
//  NewsViewController.swift
//  TabBar
//
//  Created by Tuychiev Toir on 24/10/21.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    let animals: [[String]] = [["Horse", "Cow"], ["Camel", "Sheep"], ["Goat", "Cat"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "News"
        self.view.backgroundColor = .white
        
        self.tableView = UITableView()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section+1)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return animals.count
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Ask for a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            
       // Configure the cell’s contents with the row and section number.
        cell.textLabel!.text = animals[indexPath.section][indexPath.row]
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: animals[indexPath.section][indexPath.row], message: "Section \(animals[indexPath.section])", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print(action.title! as Any)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
