//
//  PacoteViagem.swift
//  app-viagem
//
//  Created by Denis Carlos Lopes da Silva on 03/07/21.
//

import UIKit

class PacoteViagem: NSObject {
    
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    let viagem: Viagem
    
   init(nomeDoHotel: String, descricao: String, dataViagem: String, viagem: Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }

}
