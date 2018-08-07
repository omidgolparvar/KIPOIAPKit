//
//  KIAPKit+Main.swift
//  KIPOIAPKit
//
//  Created by Omid Golparvar on 6/30/18.
//  Copyright © 2018 Omid Golparvar. All rights reserved.
//

import Foundation

@objc
public class KipoIAP: NSObject {
	
	private static let InvoiceNumberKey	: String	= "KIPOIAP_InvoiceNumber"
	private static let BaseApiURL		: String	= "http://iap.kipopay.com/"
	
	private static var MerchantKey		: String	= ""
	
	private static weak var delegate	: KipoIAPDelegate?	= nil
	
	@objc
	public static func Setup(merchantKey: String) {
		MerchantKey = merchantKey.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	@objc
	public static func Setup(delegate: KipoIAPDelegate) {
		KipoIAP.delegate = delegate
	}
	
	@objc
	public static func Pay(amount: Int) {
		guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
			delegate?.kipoCannotPerform(error: .bundleIdentifierIssue)
			return
		}
		guard !MerchantKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			delegate?.kipoCannotPerform(error: .missingMerchantKey)
			return
		}
		guard MerchantKey.range(of: "^98[9][0-9]{9,9}$", options: .regularExpression, range: nil, locale: nil) != nil else {
			delegate?.kipoCannotPerform(error: KipoError.invalidMerchantKey)
			return
		}
		
		let invoiceNumber = GetInvoiceNumber()
		
		let url = URL(string: BaseApiURL	+ "?" +
			"bi=\(bundleIdentifier)"		+ "&" +
			"in=\(String(invoiceNumber))"	+ "&" +
			"mp=\(MerchantKey)"				+ "&" +
			"a=\(amount)"					+ "&" +
			"os=ios"
		)!
		
		guard UIApplication.shared.canOpenURL(url) else {
			delegate?.kipoCannotPerform(error: KipoError.applicationCannotOpenURL)
			return
		}
		
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
	}
	
	@objc
	public static func Check(_ url: URL) -> Bool {
		// > {}://app/token/{token}
		// > {}://app/error/{message}
		
		guard let host = url.host, host == "app", url.pathComponents.count == 3 else { return false }
		let action = url.pathComponents[1]
		switch action {
		case "token"	: KipoIAP.delegate?.kipoPayment(paymentToken: url.pathComponents[2])
		case "error"	: KipoIAP.delegate?.kipoPayment(errorMessage: url.pathComponents[2])
		default:
			return false
		}
		
		return true
	}
	
	
	private static func GetInvoiceNumber() -> Int {
		let userDefaults = UserDefaults.standard
		if let invoiceNumber = userDefaults.object(forKey: InvoiceNumberKey) as? Int {
			userDefaults.set(invoiceNumber + 1, forKey: InvoiceNumberKey)
			userDefaults.synchronize()
			return invoiceNumber
		} else {
			userDefaults.set(10000, forKey: InvoiceNumberKey)
			userDefaults.synchronize()
			return 10_000
		}
	}
	
}
