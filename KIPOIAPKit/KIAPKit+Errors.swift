//
//  KIAPKit+Errors.swift
//  KIPOIAPKit
//
//  Created by Omid Golparvar on 7/8/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

import Foundation

@objc
public enum KipoError: Int, Error, CustomStringConvertible {
	
	case missingMerchantKey			= 1000
	case invalidMerchantKey
	case applicationCannotOpenURL
	case invalidToken
	case bundleIdentifierIssue
	
	public var description: String {
		switch self {
		case .missingMerchantKey:
			return "KIPOIAP Error - Missing Merchant Key."
		case .invalidMerchantKey:
			return "KIPOIAP Error - Invalid Merchant Key; It should be a valid persian phone number like 989*********."
		case .applicationCannotOpenURL:
			return "KIPOIAP Error - Application Cannot Open HTTP URL."
		case .invalidToken:
			return "KIPOIAP Error - Invalid Token."
		case .bundleIdentifierIssue:
			return "KIPOIAP Error - Can Not Get Bundle Identifier."
		}
	}
	
}

