//
//  PacotesViagensViewController.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 30/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagens.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        celulaPacote.backgroundColor = UIColor.blue
        
        return celulaPacote
    }
    


}
