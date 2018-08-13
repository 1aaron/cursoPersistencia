//
//  ViewController.swift
//  persistenciaDatos
//
//  Created by Developer on 8/8/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var lblMostrar: UILabel!
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var edtNombre: UITextField!
    @IBOutlet weak var edtApellido: UITextField!
    @IBOutlet weak var edtColorFondo: UITextField!
    @IBOutlet weak var edtEdad: UITextField!
    var guardar = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func guardarDefaults(_ sender: Any) {
        if let nombre = edtNombre.text, let apellido = edtApellido.text, let color = edtColorFondo.text, let edad = edtEdad.text, (!nombre.isEmpty && !apellido.isEmpty && !color.isEmpty && !edad.isEmpty) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue(nombre, forKey: "name")
            newUser.setValue(color, forKey: "colorbg")
            newUser.setValue(apellido, forKey: "lastName")
            newUser.setValue(Int(edad), forKey: "age")
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            performSegue(withIdentifier: "sendPrefs", sender: self)
        } else {
            let alert = UIAlertController(title: "Error", message: "Llena ambos campos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "default"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        /*if guardar {
            if let nombre = edtNombre.text, let apellido = edtApellido.text, !nombre.isEmpty && !apellido.isEmpty {
                UserDefaults.standard.setValue(nombre, forKey: "name")
                UserDefaults.standard.setValue(apellido, forKey: "lastName")
                guardar = false
                btnGuardar.setTitle("Mostrar", for: .normal)
                edtNombre.text = ""
                edtApellido.text = ""
                lblMostrar.text = ""
            } else {
                let alert = UIAlertController(title: "Error", message: "Llena ambos campos.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "default"), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            if let name = UserDefaults.standard.string(forKey: "name"), let lastName = UserDefaults.standard.value(forKey: "lastName") {
                lblMostrar.text = "Name: \(name) and last name: \(lastName)"
                guardar = true
                btnGuardar.setTitle("Guardar", for: .normal)
            } else {
                let alert = UIAlertController(title: "Error", message: "No hay datos guardados", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "default"), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }*/
    }
}

