//
//  ThirdViewController.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 05.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    //MARK: - енум описание ячейки
    enum SectionKind: Int, CaseIterable {
        case list  , grid3
       //упарвление ячейками
        var columnCount: Int {
            switch self {
            case .list:
                return 3
            case .grid3:
                return 1
            }
        }
        
    }
    
    //MARK: - обьект класса DifableDataSource
    
    var dataSource: UICollectionViewDiffableDataSource<SectionKind,Int>! = nil
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupVieContr()
        
       
    }
    
    
   private func setupVieContr() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.9334655855, green: 0.9334655855, blue: 0.9334655855, alpha: 1)
    //MARK: - register our cells
        collectionView.register(FoodCell.self, forCellWithReuseIdentifier: FoodCell.reuseId)
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
         view.addSubview(collectionView)
    
    //MARK: - вызов функций настройки ячеек
    setupDataSourse()
     reloadData()
    }
    
    func configure<T: SelfConfiguringCell>(cellType: T.Type , with intValue: Int ,for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Error \(cellType)")
        }
        return cell
    }
    //MARK: - реализация DataSourse
    private func setupDataSourse() {
        dataSource = UICollectionViewDiffableDataSource<SectionKind,Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, intValue) -> UICollectionViewCell? in
            let section = SectionKind(rawValue: indexPath.section)!
            switch section {

            case .list:
                return self.configure(cellType: UserCell.self, with: intValue, for: indexPath)
            case .grid3:
                return self.configure(cellType: FoodCell.self, with: intValue, for: indexPath)            }
        })
    }
    
    //MARK: - ReloadData Снапшот для загрузки данных
    
    func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<SectionKind, Int>()
        let itemsPerSection = 10
        SectionKind.allCases.forEach { (sectionKind) in
            //MARK: - распределение количества секций
            let itemsOffSet = sectionKind.columnCount*itemsPerSection
            let itemUpperBound = itemsOffSet + itemsPerSection
            snapShot.appendSections([sectionKind])
            snapShot.appendItems(Array(itemsOffSet..<itemUpperBound))
        }
         dataSource.apply(snapShot, animatingDifferences: false)
    }
    
     //MARK: - example layout
    
             private func createLayout() -> UICollectionViewLayout {
                let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                    let section = SectionKind(rawValue: sectionIndex)!
                    switch section {
                        //лайоуты для двух случаев
                    case .list:
                        return self.createListSection()
                    case .grid3:
                        return self.createGrid3Section()
                    }
                }
                
                
                 //MARK: - расстояние между секциями
                let config = UICollectionViewCompositionalLayoutConfiguration()
                config.interSectionSpacing = 50
                layout.configuration = config
                 return layout
             }
//MARK: -  settings for list section
    private func createListSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize )
        //item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 2)
        let spasing = CGFloat(20)
        group.interItemSpacing = .fixed(spasing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spasing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spasing, bottom: 0, trailing: spasing)
        return section
    }
//MARK: -  settings for grid3 section
    
    private func createGrid3Section() -> NSCollectionLayoutSection {
          
//          let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
//          let item = NSCollectionLayoutItem(layoutSize: itemSize )
//          //item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 2)
//          let spasing = CGFloat(20)
//          group.interItemSpacing = .fixed(spasing)
//
//          let section = NSCollectionLayoutSection(group: group)
//          section.interGroupSpacing = spasing
//          section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spasing, bottom: 0, trailing: spasing)
//          return section
        //second variant
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
        let layoutGrupSize = NSCollectionLayoutSize(widthDimension: .estimated(104), heightDimension: .estimated(88))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGrupSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 12, bottom: 0, trailing: 12)
        
        
        return layoutSection
      }
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource

//extension ThirdViewController: UICollectionViewDelegate,UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 11
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .brown
//        cell.layer.borderWidth = 2
//        cell.layer.cornerRadius = 15
//        return cell
//    }
//
//
//}
