//
//  PersonalDetailViewController.swift
//  ReissueCardPrjct
//
//  Created by Bimal@AppStation on 07/10/22.


import UIKit

protocol PassDataToreissueVcdelegate {
    func passCellModelOfPersonDetail(cellModel: PersonalDetailTableViewModel)
}

class PersonalDetailViewController: UIViewController, PassDataToPersonVcDelegate, UITextFieldDelegate {
   
 
    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var delegates: PassDataToreissueVcdelegate?
    var personalDetailArray = [PersonalDetailTableViewModel]()
    var isSelectTamwinCardNumberbutton = Bool()
    var iconClick = true
    var isSelectFromPersonDetailCell = Bool()
    var isSelectButton = Bool()
    var cellModelFromDropDownTamwinCard: TamwinCardTableViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPersonalDetailModel()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func setPersonalDetailModel() {
        
        let familyNumber = PersonalDetailTableViewModel(strTitle: "Family Number", cellType: .familyNumberCell)
        let tamwinCardNumber = PersonalDetailTableViewModel(strTitle: "Tamwin Card Number", cellType: .dropDownCell)
        let requestNumber = PersonalDetailTableViewModel(strTitle: "Request Number *", cellType: .requestNumberCell)
        let familyType = PersonalDetailTableViewModel(strTitle: "Family Type", cellType: .familyTypeCell)
        
        personalDetailArray.append(familyNumber)
        personalDetailArray.append(tamwinCardNumber)
        personalDetailArray.append(requestNumber)
        personalDetailArray.append(familyType)
        
    }
    
    
    func passTextFieldInFamilyNumber(strFamilyNumber: String, passModel: PersonalDetailTableViewModel) {
        for model in personalDetailArray {
            if model.cellType == passModel.cellType {
                model.enteredtextFieldInFamilyNumber = strFamilyNumber
            }
        }
    }
    
    func buttonActionTamwinPass(sender: UIButton) {
         
        if(iconClick == true) {
            print("Tamwin Card Number dropdown Seleted")
            isSelectButton = true
        } else {
            print("Tamwin Card Number dropdown Unseleted")
            isSelectButton = false
        }
        iconClick = !iconClick
        
        tableView.reloadData()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("textFieldDidChange")
        for model in personalDetailArray {
            delegates?.passCellModelOfPersonDetail(cellModel: model)
        }
        
    }
    
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

           var contentInset:UIEdgeInsets = self.tableView.contentInset
           contentInset.bottom = keyboardFrame.size.height + 20
            tableView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInset
    }

}

// MARK: - Table

extension PersonalDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalDetailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = personalDetailArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! PersonalDetailTableViewCell
       
        cell.delegate = self
        
        if cellModel.cellType == .dropDownCell {
            if isSelectButton == true {
                if cellModel.cellType == .dropDownCell {
                    cell.heightOfViewInTamwinCardNumber?.constant = 113
                }
            }
            else {
                cell.heightOfViewInTamwinCardNumber?.constant = 0
            }
        }
        
        if cellModel.cellType == .familyNumberCell {
            cell.textFieldEnter?.addTarget(self, action: #selector(PersonalDetailViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        }
        cell.cellModel = cellModel
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let cellModel = personalDetailArray[indexPath.row]
//        if cellModel.cellType == .dropDownCell {
//            if isSelectTamwinCardNumberbutton == true {
//
//                return 254
//
//            }
//        }
//
//        return 87
//
//    }
}
