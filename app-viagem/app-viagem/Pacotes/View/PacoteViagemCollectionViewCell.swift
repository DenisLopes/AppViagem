//
//  PacoteViagemCollectionViewCell.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 30/06/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    
    func configuraCelulaPacote(pacote: PacoteViagem){
        labelTitulo.text = pacote.viagem.titulo
        labelQuantidadeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255, green: 85.0/255, blue: 85.0/255, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
    
}
