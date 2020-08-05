//
//  CompositionalVC.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 04.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit

class CompositionalVC: UIViewController {
    
 var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupVieContr()
    }
    
    func setupVieContr() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout03())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.9334655855, green: 0.9334655855, blue: 0.9334655855, alpha: 1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
 //MARK: - 01 example layout
    private func createLayout() -> UICollectionViewLayout {
        
        //section -> groups -> items -> size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize )
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    //MARK: - 02 example layout
       private func createLayout02() -> UICollectionViewLayout {
           
           //section -> groups -> items -> size
           
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
           let item = NSCollectionLayoutItem(layoutSize: itemSize )
        //отступы
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
           
           let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
           let layout = UICollectionViewCompositionalLayout(section: section)
           
           return layout
       }
    //MARK: - 03 example layout
          private func createLayout03() -> UICollectionViewLayout {
              //section -> groups -> items -> size
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
             let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 2)
            //расстояние между группами
            let spasing = CGFloat(10)
            group.interItemSpacing = .fixed(spasing)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spasing
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spasing, bottom: 0, trailing: spasing)
              let layout = UICollectionViewCompositionalLayout(section: section)
              
              return layout
          }
    
    
    
    
}
//MARK: - UICollectionViewDelegate,UICollectionViewDataSource

extension CompositionalVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 15
        return cell
    }
    
    
}





//MARK: - подключение канваса через свифтЮАй (вместо симулятора)

import SwiftUI

struct CompositionalProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
       let tabBar = MainTabbarController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<CompositionalProvider.ContainerView>) -> MainTabbarController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: CompositionalProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CompositionalProvider.ContainerView>) {
            
        }
        
        
    }
}
