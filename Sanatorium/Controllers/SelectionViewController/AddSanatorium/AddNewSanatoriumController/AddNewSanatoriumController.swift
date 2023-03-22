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
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var lonField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGesture()
        photoImageView.layer.cornerRadius = 50
        photoImageView.layer.borderWidth = 0.5
    }
    
    func addSanatorium(completion: @escaping (AddSanatoriumResult) -> Void) {
        
        upload(currentSanatoriumName: nameOfSanatoriumField.text!, photo: photoImageView.image!) { (result) in
            switch result {
                case .success(let url):
                    let db = Firestore.firestore()
                    db.collection("sanatoriums").addDocument(data: [
                        "imageURL": url.absoluteString,
                        "nameOfSanatorium": self.nameOfSanatoriumField.text!,
                        "adressOfSanatorium": self.adressOfSanatoriumField.text!,
                        "id": self.ownerIdOfRegion!,
                        "telefon": self.telefonField.text!,
                        "lat": self.latField.text!,
                        "lon": self.lonField.text!
                        
                        
                    ]) { (error) in
                        if let error = error {
                            completion(.failure(error))
                        }
                        completion(.success)
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }

    }
    
    func upload(currentSanatoriumName: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child("imageOfSanatorium").child(currentSanatoriumName)
        
        guard let imageData = photoImageView.image?.jpegData(compressionQuality: 0.4) else { return }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard let metadata = metadata else {
                completion(.failure(error!))
                return
            }
            ref.downloadURL { (url, error) in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
            }
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
