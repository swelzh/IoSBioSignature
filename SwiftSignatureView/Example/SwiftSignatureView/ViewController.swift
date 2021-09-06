//
//  ViewController.swift
//  SwiftSignatureView
//
//  Created by Alankar Misra on 07/17/2015.
//
// SwiftSignatureView is available under the MIT license. See the LICENSE file for more info.

import UIKit
import SwiftSignatureView

final class ViewController: UIViewController {
    // Use signatureView.signature to get at the signature image
    @IBOutlet weak var signatureView: SwiftSignatureView!

    @IBOutlet weak var croppedSignatureView: UIImageView!

    override public func viewDidLoad() {
        super.viewDidLoad()
      signatureView.delegate = self
    }

    @IBAction func didTapClear() {
        signatureView.clear()
    }

    @IBAction func didTapRedo(_ sender: Any) {
        signatureView.redo()
    }

    @IBAction func didTapUndo(_ sender: Any) {
        signatureView.undo()
    }

    @IBAction func didTapRefreshCroppedSignature() {
        croppedSignatureView.image = signatureView.getCroppedSignature()
        print("fullRender \(croppedSignatureView.image?.size ?? CGSize.zero)")
    }

}

extension  ViewController: SwiftSignatureViewDelegate {

    func swiftSignatureViewDidDrawGesture(_ view: ISignatureView, _ tap: UIGestureRecognizer) {
        print("swiftSignatureViewDidDrawGesture")
    }

    func swiftSignatureViewDidDraw(_ view: ISignatureView) {
        print("swiftSignatureViewDidDraw")
    }

}
