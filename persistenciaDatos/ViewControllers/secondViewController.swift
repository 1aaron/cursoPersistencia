//
//  secondViewController.swift
//  persistenciaDatos
//
//  Created by Developer on 8/13/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MyClda {
            cell.setName(name: (result[indexPath.row].value(forKey: "name") as! String), lastName: result[indexPath.row].value(forKey: "lastName") as! String)
            return cell
        } else {
            return MyClda()
        }
    }
    
    @IBOutlet weak var lnlNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    var result = [NSManagedObject]()
    @IBOutlet weak var tableUsuarios: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableUsuarios.dataSource = self
        tableUsuarios.delegate = self
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            result = try context.fetch(request) as! [NSManagedObject]
            for data in result {
                lblEdad.text = data.value(forKey: "age") as? String
                lblColor.text = data.value(forKey: "colorbg") as? String
                lblApellido.text = data.value(forKey: "lastName") as? String
                lnlNombre.text = data.value(forKey: "name") as? String
                //self.view.backgroundColor = UIColor(named: data.value(forKey: "colorbg") as! String)
            }
            tableUsuarios.reloadData()
        } catch {
            
            print("Failed")
        }

    }
}
