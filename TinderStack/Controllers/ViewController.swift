//
//  ViewController.swift
//  TinderStack
//
//  Created by Osama Naeem on 16/03/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var viewModelData = [CardsDataModel(bgColor: UIColor(named: "C1")!,  image: "P1"),
                         CardsDataModel(bgColor: UIColor(named: "C2")!,  image: "P2"),
                         CardsDataModel(bgColor: UIColor(named: "C3")!,  image: "P3"),
                         CardsDataModel(bgColor: UIColor(named: "C4")!,  image: "P4"),
                         CardsDataModel(bgColor: UIColor(named: "C5")!,  image: "P5"),
                         CardsDataModel(bgColor: UIColor(named: "C6")!,  image: "P6"),
                         CardsDataModel(bgColor: UIColor(named: "C7")!,  image: "P7"),
                         CardsDataModel(bgColor: UIColor(named: "C8")!,  image: "P8"),
                         CardsDataModel(bgColor: UIColor(named: "C9")!,  image: "P9"),
                         CardsDataModel(bgColor: UIColor(named: "C10")!, image: "P10"),
                         CardsDataModel(bgColor: UIColor(named: "C11")!, image: "P13"),
                         CardsDataModel(bgColor: UIColor(named: "C12")!, image: "P12"),
                         CardsDataModel(bgColor: UIColor(named: "C13")!, image: "P13"),
                         CardsDataModel(bgColor: UIColor(named: "C14")!, image: "P14"),
                         CardsDataModel(bgColor: UIColor(named: "C15")!, image: "P15"),
                         CardsDataModel(bgColor: UIColor(named: "C16")!, image: "P16"),
                         CardsDataModel(bgColor: UIColor(named: "C17")!, image: "P17"),
                         CardsDataModel(bgColor: UIColor(named: "C18")!, image: "P18"),
                         CardsDataModel(bgColor: UIColor(named: "C19")!, image: "P19"),
                         CardsDataModel(bgColor: UIColor(named: "C20")!, image: "P20")]
    var stackContainer : StackContainerView!
    
    //MARK: - Init
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stackContainer = StackContainerView()
        view.addSubview(stackContainer)
        configureStackContainer()
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Show image"
        stackContainer.dataSource = self
    }
    
    //MARK: - Configurations
    func configureStackContainer() {
        stackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackContainer.widthAnchor.constraint(equalToConstant: 350).isActive = true
        stackContainer.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        stackContainer.layer.shadowColor = UIColor.black.cgColor
        stackContainer.layer.shadowOpacity = 0.5
        stackContainer.layer.shadowOffset = CGSize(width: 0, height: 20)
        stackContainer.layer.shadowRadius = 25
       
    }
    
    //MARK: - Handlers
    @objc func resetTapped() {
        stackContainer.reloadData()
    }

}

extension ViewController : SwipeCardsDataSource {

    func numberOfCardsToShow() -> Int {
        return viewModelData.count
    }
    
    func card(at index: Int) -> SwipeCardView {
        let card = SwipeCardView()
        card.dataSource = viewModelData[index]
        return card
    }
    
    func emptyView() -> UIView? {
        return nil
    }
}
