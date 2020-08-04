//
//  ListViewController.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 04.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
         
        setupVieContr()
    }
    
    
    func setupVieContr() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.9334655855, green: 0.9334655855, blue: 0.9334655855, alpha: 1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}
//MARK: - UICollectionViewDelegate,UICollectionViewDataSource

extension ListViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100
        )
    }
}

//MARK: - подключение канваса через свифтЮАй ( вместо симулятора)

import SwiftUI
struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
       let tabBar = MainTabbarController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) -> MainTabbarController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: FlowProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) {
            
        }
        
        
    }
}

