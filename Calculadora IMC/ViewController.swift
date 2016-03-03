//
//  ViewController.swift
//  Calculadora IMC
//
//  Created by Armando  on 15/01/16.
//  Copyright © 2016 Armando Blanco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var estatura: UITextField!
    @IBOutlet weak var peso: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        peso.delegate=self
        estatura.delegate=self
    }
    
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto:CGPoint
        punto=CGPointMake(0, textField.frame.origin.y-50)
        self.scroll.setContentOffset(punto, animated: true)
    }
    
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
    }
    
    @IBAction func backgroundTap(sender: UIControl)
        {
            peso.resignFirstResponder()
            estatura.resignFirstResponder()
    }
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder() // Desaparecer teclado
    }
        
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado=imc()
        let sigVista=segue.destinationViewController as! VistaResultados
        sigVista.indiceIM=resultado
    }

    @IBAction func calcularIMC(sender: AnyObject) {
        imc()
    }
    func imc()->Double{
    var IMC:Double
    let pesoLocal:Double?
    pesoLocal=Double(self.peso.text!)!
    let estaturaLocal:Double=Double(self.estatura.text!)!
    IMC=pesoLocal! / (estaturaLocal*estaturaLocal)
    print("Resultado:\(IMC)")
    return IMC
    }
    
}

