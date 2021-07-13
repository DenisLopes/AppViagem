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
    
//    @IBOutlet weak var scrollPrincipal: UIScrollView!
//    @IBOutlet weak var textFieldData: UITextField!
    
    
    var pacoteSelecionado:PacoteViagem? = nil

    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        super.viewDidLoad()
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagemPacoteViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }

    }
    
    @objc func exibeData(sender: UIDatePicker){
        let formataData = DateFormatter()
        formataData.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formataData.string(from: sender.date)
    }
    
    @objc func aumentarScroll(notification: Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
    @IBAction func textFieldDate(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeData(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }
    }
    
    
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
