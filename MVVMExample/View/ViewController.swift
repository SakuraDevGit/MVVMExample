//
//  ViewController.swift
//  MVVMExample
//
//  Created by Rudi on 2/1/18.
//  Copyright © 2018 SakuraDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: HiraganaViewModel!
    var hiraganaToShow = [Hiragana]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // We instantiate the view model and give it the function to call as a reference.
        viewModel = HiraganaViewModel(updateView: updateView)
    }
    
    func updateView(state: HiraganaViewModelState) {
        // Update the view with the latest state from the view model.
        hiraganaToShow = state.hiragana
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hiraganaToShow.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hiragana = hiraganaToShow[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HiraganaTableViewCell", for: indexPath) as! HiraganaTableViewCell
        cell.setHiraganaToShow(hiragana: hiragana)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hiragana = hiraganaToShow[indexPath.row]
        viewModel.setSelectedHiragana(id: hiragana.id)
    }
}
