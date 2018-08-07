//
//  KIAPKit+Delegate.swift
//  KIPOIAPKit
//
//  Created by Omid Golparvar on 7/8/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

import Foundation

@objc
public protocol KipoIAPDelegate: NSObjectProtocol {
	
	@objc
	func kipoCannotPerform(error: KipoError)
	
	@objc
	func kipoPayment(paymentToken token: String)
	
	@objc
	func kipoPayment(errorMessage: String)
	
}
