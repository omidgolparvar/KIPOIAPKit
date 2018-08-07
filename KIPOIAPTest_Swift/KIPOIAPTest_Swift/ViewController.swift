//
//  ViewController.swift
//  KIPOIAPTest_Swift
//
//  Created by Omid Golparvar on 6/30/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

import UIKit
import KIPOIAPKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func actionTest(_ sender: UIButton) {
		print("Starting Test...")
		KipoIAP.Setup(merchantKey: "09372208177")
		KipoIAP.Setup(delegate: self)
		KipoIAP.Pay(amount: 10000)
		KipoIAP.Check(url)
	}

}

extension ViewController: KipoIAPDelegate {
	
	func kipoCannotPerform(error: KipoError) {
		print(#function + " - Error: " + error.description)
	}
	
	func kipoPayment(paymentToken token: String) {
		print(#function + " - PaymentToken: " + token)
	}
	
	func kipoPayment(errorMessage: String) {
		print(#function + " - Error: " + errorMessage)
	}
	
}
