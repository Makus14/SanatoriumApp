//
//  AddNewSanatoriumController.swift
//  Sanatorium
//
//  Created by Mac on 24/02/2023.
//

import UIKit
import Firebase
import FirebaseStorage

class AddNewSanatoriumController: UIViewController {

    var ownerIdOfRegion: String?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameOfSanatoriumField: UITextField!
    @IBOutlet weak var adressOfSanatoriumField: UITextField!
    @IBOutlet weak var telefonField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGesture()
        photoImageView.layer.cornerRadius = 50
        photoImageView.layer.borderWidth = 0.5
    }
    
    func addSanatorium(completion: @escaping (AddSanatoriumResult) -> Void) {
        let db = Firestore.firestore()
        db.collection("sanatoriums").addDocument(data: [
            "nameOfSanatorium": self.nameOfSanatoriumField.text!,
            "adressOfSanatorium": self.adressOfSanatoriumField.text!,
            "id": ownerIdOfRegion!,
            "telefon": telefonField.text!
            
        ]) { (error) in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success)
        }
    }
    
    
    

    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func viewDidTap() {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func setImageDidTap(_ sender: Any) {
        let imagePikerController = UIImagePickerController()
        imagePikerController.delegate = self
        imagePikerController.sourceType = .photoLibrary
        present(imagePikerController, animated: true)
        
    }
    
    @IBAction func addSanatoriumDidTap(_ sender: Any) {
        addSanatorium { (result) in
            switch result {
                case .success:
                    print("Санаторий добавлен")
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
    
}

extension AddNewSanatoriumController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
}
