//
//  ViewController.swift
//  Settings
//
//  Created by Пётр  on 06.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var cells: [[Cell]]?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarhy()
        setupLayout()
        
    }
    
    // MARK: - Setups
    
    private func setupView() {
        cells = Cell.cells
        title = "Setings"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray4
    }
    
    private func setupHierarhy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
}
//MARK: - Extensions

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.cell = cells?[indexPath.section][indexPath.row]
        
        if cell?.cell?.toggle != nil {
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.tag = indexPath.row
            switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
            cell!.accessoryView = switchView
            cell?.selectionStyle = .default
        } else {
            cell?.accessoryType = .disclosureIndicator
            cell?.textLabel?.text = cell?.cell?.text
            cell?.textLabel?.textAlignment = .right
            cell?.textLabel?.textColor = .systemGray
            cell?.textLabel?.font = .systemFont(ofSize: 17)
        }
        return cell ?? TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func switchChanged(_ sender: UISwitch!) {
        print("table row switch Changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
}



