//
//  InfoFooterView.swift
//  aic
//
//  Created by Filippo Vanucci on 11/21/17.
//  Copyright © 2017 Art Institute of Chicago. All rights reserved.
//

import UIKit

class InfoFooterView: UIView {
	let bloombergCreditsImageView = UIImageView()
	let potionCreditsTextView = UITextView()

	let bloomberCreditsTopMargin: CGFloat = 62
  let bloomberCreditsLeadingMargin: CGFloat = 16
	let potionCreditsTopMargin: CGFloat = 38
  let potionCreditsLeadingMargin: CGFloat = 16
	let bottomMargin: CGFloat = 48

	init() {
		super.init(frame: CGRect.zero)

		backgroundColor = .aicInfoColor

		bloombergCreditsImageView.image = #imageLiteral(resourceName: "bloombergLogo")

        let localizedVersion = "info_version".localizedFormat(arguments: Bundle.versionNumber, using: "Info")
        let localizedPotionCredits = localizedVersion + " " + "info_designed_by".localized(using: "Info")
		let potionCreditsAttrString = NSMutableAttributedString(string: localizedPotionCredits)
		let potionUrl = URL(string: Common.Info.potionURL)!
		potionCreditsAttrString.addAttributes([.link: potionUrl], range: NSRange(location: 0, length: potionCreditsAttrString.string.count))

		potionCreditsTextView.attributedText = potionCreditsAttrString
		potionCreditsTextView.font = .aicPotionCreditsFont
		potionCreditsTextView.setDefaultsForAICAttributedTextView()
		potionCreditsTextView.linkTextAttributes = [.foregroundColor: UIColor.white]
		potionCreditsTextView.delegate = self

		addSubview(bloombergCreditsImageView)
		addSubview(potionCreditsTextView)

		// Accessibility
		bloombergCreditsImageView.isAccessibilityElement = true
		bloombergCreditsImageView.accessibilityLabel = "Sponsored by Bloomberg Philantropies"
		bloombergCreditsImageView.accessibilityTraits = .image
		potionCreditsTextView.accessibilityTraits = .link
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func updateConstraints() {
		bloombergCreditsImageView.autoPinEdge(.top, to: .top, of: self, withOffset: bloomberCreditsTopMargin)
		bloombergCreditsImageView.autoPinEdge(.leading, to: .leading, of: self, withOffset: bloomberCreditsLeadingMargin)

		potionCreditsTextView.autoPinEdge(.top, to: .bottom, of: bloombergCreditsImageView, withOffset: potionCreditsTopMargin)
		potionCreditsTextView.autoPinEdge(.leading, to: .leading, of: self, withOffset: potionCreditsLeadingMargin)
		potionCreditsTextView.autoPinEdge(.trailing, to: .trailing, of: self)

		super.updateConstraints()
	}
}

// Observe links for passing analytics
extension InfoFooterView: UITextViewDelegate {
	func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
		// Log Analytics

		return true
	}
}
