//
//  PacotesViagensViewController.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 30/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!

    
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorlabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.configuraCelulaPacote(pacote: pacoteAtual)
        
        return celulaPacote
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20, height: 160) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "detalheViagem") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            listaViagens = listaViagens.filter({ $0.viagem.titulo.contains(searchText) })
        }
                
        self.labelContadorPacotes.text = self.atualizaContadorlabel()
        colecaoPacotesViagens.reloadData()
    }
    
    func atualizaContadorlabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
    


}
