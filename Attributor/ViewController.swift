//
//  ViewController.swift
//  Attributor
//
//  Created by 郭家政 on 2017/4/11.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var _textView: UITextView!
	@IBOutlet weak var _outlineButton: UIButton!
	@IBOutlet weak var _unoutlineButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self._outlineButton.layer.cornerRadius = 5
		self._unoutlineButton.layer.cornerRadius = 5
		self._outlineButton.layer.borderWidth = 1
		self._unoutlineButton.layer.borderWidth = 1
		self._outlineButton.layer.borderColor = UIColor.black.cgColor
		self._unoutlineButton.layer.borderColor = UIColor.black.cgColor
		let attribute = NSAttributedString(string: "Outline",
		                                   attributes: [NSStrokeColorAttributeName : UIColor.black,
		                                                NSForegroundColorAttributeName : UIColor.white,
		                                                NSStrokeWidthAttributeName : NSNumber(value: 4.0)])
		self._outlineButton.setAttributedTitle(attribute, for: UIControlState.normal)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func SetTextColor(_ sender: UIButton) {
		let range: NSRange = self._textView.selectedRange

		let attribute = [NSStrokeColorAttributeName : sender.backgroundColor!,
		                 NSForegroundColorAttributeName: sender.backgroundColor!]

		self._textView.textStorage.addAttributes(attribute, range: range)
	}

	@IBAction func SetTextOutline() {
		let range: NSRange = self._textView.selectedRange

		let attribute = [NSStrokeWidthAttributeName : NSNumber(value: 4.0)]

		self._textView.textStorage.addAttributes(attribute, range: range)
	}

	@IBAction func SetTextUnoutline() {
		let range: NSRange = self._textView.selectedRange

		self._textView.textStorage.removeAttribute(NSStrokeWidthAttributeName, range: range)
	}
}
