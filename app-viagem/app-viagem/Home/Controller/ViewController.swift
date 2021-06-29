//
//  ViewController.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 28/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    // MARK: - Atributos
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }
    
    // MARK: - Metodos
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco.text = viagemAtual.preco
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.imagemViagem.layer.cornerRadius = 10
        celula.imagemViagem.layer.masksToBounds = true
        
        return celula
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}

