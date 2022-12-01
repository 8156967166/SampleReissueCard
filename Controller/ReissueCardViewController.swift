//
//  ReissueCardViewController.swift
//  ReissueCardPrjct
//  Created by Bimal@AppStation on 07/10/22.
//

import UIKit

class ReissueCardViewController: UIViewController, PassDataToreissueVcdelegate {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewInPrevious: UIView!
    @IBOutlet weak var viewInNext: UIView!
    @IBOutlet weak var labelInPrevious: UILabel!
    @IBOutlet weak var labelInNext: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInScroll: UIView!
    @IBOutlet weak var labelPersonalDetail: UILabel!
    @IBOutlet weak var labelReason: UILabel!
    @IBOutlet weak var labelDeliveryMode: UILabel!
    @IBOutlet weak var viewInPersonalDetailNumber: UIView!
    @IBOutlet weak var viewInReasonNumber: UIView!
    @IBOutlet weak var viewInDeliveryModeNumber: UIView!
    @IBOutlet weak var viewInPersonalDetail: UIView!
    @IBOutlet weak var viewInReason: UIView!
    @IBOutlet weak var viewInDeliveryMode: UIView!
    @IBOutlet weak var imagePersonalDetailComplete: UIImageView!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPersonaldetils: UIButton!
    @IBOutlet weak var buttonReason: UIButton!
    @IBOutlet weak var buttonDeliveryMode: UIButton!
    @IBOutlet weak var viewExit: UIView!
    @IBOutlet weak var viewInfo: UIView!
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewExit.isHidden = true
        // Do any additional setup after loading the view.
    }
    var cellModelFromPersonDetail: PersonalDetailTableViewModel?
    var isSelectButtonNext = Bool()
    var heightFromRequestNumber: NSLayoutConstraint!
    var selectedTab = 2
   
    // MARK: - functions
    
    func setViewColor() {
        viewInPrevious.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInNext.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        labelInPrevious.textColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
        labelInNext.textColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
    }
    
    func setdisable() {
        labelPersonalDetail.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelReason.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelDeliveryMode.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewInPersonalDetailNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInReasonNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInDeliveryModeNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        viewInReason.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
    }
    
    func passCellModelOfPersonDetail(cellModel: PersonalDetailTableViewModel) {
        cellModelFromPersonDetail = cellModel
        
//        if cellModelFromPersonDetail?.cellType == .familyNumberCell {
//            if cellModel.enteredtextFieldInFamilyNumber.isEmpty == true {
//
//            }
//        }
      
    }
    
    
    // MARK: - ButtonAction
    
    @IBAction func buttonActionPrevious(sender: UIButton) {
      
        setViewColor()
        labelInPrevious.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInPrevious.backgroundColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)

        if scrollView.contentOffset.x == 0 {
            
        }
        
        else if scrollView.contentOffset.x == viewInScroll.bounds.width {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            buttonActionPersonalDetail(sender: buttonPersonaldetils)
            selectedTab = selectedTab - 1
           
        }
        else {
            scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
            buttonActionReason(sender: buttonReason)
            selectedTab = selectedTab - 1
        }
        
        
//        if scrollView.contentOffset.x > 0 {
//            scrollView.contentOffset.x -=  viewInScroll.bounds.width
////            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//        }
    
    }
    
    @IBAction func buttonActionNext(sender: UIButton) {
        setViewColor()
        labelInNext.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewInNext.backgroundColor = #colorLiteral(red: 0, green: 0.6950383782, blue: 0.9160410762, alpha: 1)
        
//        scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
        
//        if scrollView.contentOffset.x < 2*(viewInScroll.bounds.width) {
//            scrollView.contentOffset.x +=  viewInScroll.bounds.width
//        }
        
        
        if scrollView.contentOffset.x == 0 {
            
            scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
            buttonActionReason(sender: buttonReason)
            selectedTab = selectedTab + 1
            
            
        }
        
        else if scrollView.contentOffset.x == viewInScroll.bounds.width {
            scrollView.setContentOffset(CGPoint(x: 2*(viewInScroll.bounds.width), y: 0), animated: true)
            buttonActionDeliveryMode(sender: buttonDeliveryMode)
            selectedTab = selectedTab + 1
           
        }
    }
    
    func showAlert() {
        print("Alert show")
        let alertController = UIAlertController(title: "Alert", message: "Fill Family Number", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PersonalDetailViewController" {
            let secondViewController = segue.destination as! PersonalDetailViewController
            secondViewController.delegates = self
        }
    }
    
    
    @IBAction func buttonActionPersonalDetail(sender: UIButton) {
        viewExit.isHidden = true
        viewInfo.isHidden = false
        selectedTab = 0
        setdisable()
        labelPersonalDetail.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInPersonalDetailNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInPersonalDetail.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
    
    @IBAction func buttonActionReason(sender: UIButton) {
    
        viewExit.isHidden = false
        viewInfo.isHidden = true
        selectedTab = 1
        setdisable()
        labelReason.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInReasonNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInReason.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
//        let screenSize: CGRect = UIScreen.main.bounds
//        scrollView.setContentOffset(CGPoint(x: screenSize.width, y: 0), animated: true)
        scrollView.setContentOffset(CGPoint(x: viewInScroll.bounds.width, y: 0), animated: true)
        
    }
    
    @IBAction func buttonActionDeliveryMode(sender: UIButton) {
        viewExit.isHidden = false
        viewInfo.isHidden = true
        selectedTab = 2
        setdisable()
        labelDeliveryMode.textColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInDeliveryModeNumber.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.09019607843, blue: 0.2117647059, alpha: 1)
        viewInDeliveryMode.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8156862745, blue: 0.8431372549, alpha: 1)
//        let screenSize: CGRect = UIScreen.main.bounds
        scrollView.setContentOffset(CGPoint(x: 2*(viewInScroll.bounds.width), y: 0), animated: true)
    }
    
}
