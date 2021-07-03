//
//  DetalhesViagensViewController.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 03/07/21.
//

import UIKit

class DetalhesViagensViewController: UIViewController {
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagemPacoteViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    
    var pacoteSelecionado:PacoteViagem? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagemPacoteViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }

    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
