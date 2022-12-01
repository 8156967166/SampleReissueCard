//
//  ReasonViewController.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.
//

import UIKit

class ReasonViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PassDataToReasonVcDelegate {
  
    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    
    var reasonArray = [ReasonTableViewModel]()
    var setImage = UIImage()
    var iconClick = true
    var isSelectButton = Bool()
    var heightFromImageAttachment: NSLayoutConstraint?
//    var isImageVissble = false
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReasonModel()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func setReasonModel() {
//        reasonArray = []
        let reason = ReasonTableViewModel(strTitle: "Reason*", cellType: .dropDownCell)
        let reasonRemarks = ReasonTableViewModel(strTitle: "Reason Remarks", cellType: .remarkCell)
        let documentType = ReasonTableViewModel(strTitle: "Document Type*", cellType: .dropDrownDocumentCell)
        
        let imageAttachment = ReasonTableViewModel(strTitle: "", cellType: .imageAttachmentCell)
        let imageSizeDoc = ReasonTableViewModel(strTitle: "5 MB Max for 1 file ,Jpeg, Png", cellType: .imageSizeDocCell)
        reasonArray.append(reason)
        reasonArray.append(reasonRemarks)
        reasonArray.append(documentType)
        reasonArray.append(imageAttachment)
        reasonArray.append(imageSizeDoc)
        
        
    }

    func heightOfImageViewPass(heightImageView: NSLayoutConstraint) {
        heightFromImageAttachment = heightImageView
        showAlert()
    }
    
 
    func buttonActionPassImageAttachment(sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "", message: "Choose Any Option", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alertController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerConroller = UIImagePickerController()
            imagePickerConroller.delegate = self
            imagePickerConroller.sourceType = sourceType
            self.present(imagePickerConroller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true) { [weak self] in
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//               self?.profileImage.image = image
            self?.setImage = image
            for model in self?.reasonArray ?? [] {
                if model.cellType == .imageAttachmentCell {
                    model.isSelected = true
                    
                }
            }
//            self?.heightFromImageAttachment?.constant = 37.5
            print("imge ===== \(self?.setImage)")
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }
    
    func buttonActionReasonDropDownPass(sender: UIButton) {
        for model in reasonArray {
            if model.cellType == .dropDownCell {
                if model.isSelect == true {
                    model.isSelect = false
                } else {
                    model.isSelect = true
                }
            }
        }
        tableView.reloadData()
       
    }
    
    func buttonActionDocumentDropDownPass(sender: UIButton) {
        for model in reasonArray {
            if model.cellType == .dropDrownDocumentCell {
                if model.isSelectDoc == true {
                    model.isSelectDoc = false
                } else {
                    model.isSelectDoc = true
                }
            }
        }
        tableView.reloadData()
    }
    
   
   
    
}

// MARK: - Table

extension ReasonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = reasonArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! ReasonTableViewCell
       
        cell.delegate = self
        if cellModel.cellType == .imageAttachmentCell {
//            cell.heightInImageAttachmentView?.constant = 0
            cell.imageInImageAttachment?.image = self.setImage
        }
        
        if cellModel.isSelected == true {
            cell.heightInImageAttachmentView?.constant = 37.5
        }
        else {
            cell.heightInImageAttachmentView?.constant = 0
        }
      

        cell.cellModel = cellModel
//        if isSelectButton == true {
//            cell.heightInReasonDropDownView?.constant = 100
//        }
//        else {
//            cell.heightInReasonDropDownView?.constant = 0
//        }
        
        
        return cell
    }
    

}


