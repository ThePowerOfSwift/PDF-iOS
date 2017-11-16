//
//  PDFViewController.swift
//  PDF
//
//  Created by Vui Nguyen on 11/14/17.
//  Copyright © 2017 Minitex. All rights reserved.
//
import UIKit
import PSPDFKit
import PSPDFKitUI

public class PDFViewController: UIViewController  {

  var documentName = "FinancialAccounting"

  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)

    PSPDFKit.setLicenseKey("ayMdJS9o1bNAIcD2RRW4EBCT8kIbBAMIQOzZ+AuONFXi3AiEMHRcpVB7tOLb0ocsbu2+EJopWzHGHWE5sYEW0yVGpQR7N18+pijQUCwd0mF9jVBARvqviQl0bNlF9neeMDJWC4M7PXkfUjshPo7d2AZcwQgq8L8v2yZEpqGgzUq8xJwBI/xjhi6gjoazNJ+XHad91vxcfF60mrYDh9mIRcgAIdnI5IHy4w7pYV6w5wx3KftFTMYbQki1h298jARu3sHhecN58Y2MjsxMvo8cDsIMBUbGr/uqI9+jydXOf/eHw+qdYxqszCjPV5myMvUyIYpYGWkVwx+APcN6Z4+58qh0qAxf9n+LuS6UtKft/4FvQE8R7hvqePFfPTuu77sIWVAWzpYaw8d+rpXkcPs7yGZTImjeaxy+IkJZP5+jYne/6zPp7mMO1ma634ErcP0H")

  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func viewDidLoad() {
      super.viewDidLoad()

      //PSPDFKit.setLicenseKey("ayMdJS9o1bNAIcD2RRW4EBCT8kIbBAMIQOzZ+AuONFXi3AiEMHRcpVB7tOLb0ocsbu2+EJopWzHGHWE5sYEW0yVGpQR7N18+pijQUCwd0mF9jVBARvqviQl0bNlF9neeMDJWC4M7PXkfUjshPo7d2AZcwQgq8L8v2yZEpqGgzUq8xJwBI/xjhi6gjoazNJ+XHad91vxcfF60mrYDh9mIRcgAIdnI5IHy4w7pYV6w5wx3KftFTMYbQki1h298jARu3sHhecN58Y2MjsxMvo8cDsIMBUbGr/uqI9+jydXOf/eHw+qdYxqszCjPV5myMvUyIYpYGWkVwx+APcN6Z4+58qh0qAxf9n+LuS6UtKft/4FvQE8R7hvqePFfPTuu77sIWVAWzpYaw8d+rpXkcPs7yGZTImjeaxy+IkJZP5+jYne/6zPp7mMO1ma634ErcP0H")

    // Do any additional setup after loading the view.
      view.backgroundColor = .blue

    //let fileURL = Bundle.main.url(forResource: documentName, withExtension: "pdf")!
    let fileURL = Bundle(identifier: "edu.umn.minitex.simplye.PDF")?.url(forResource: documentName, withExtension: "pdf")
    let document = PSPDFDocument(url: fileURL!)

    let configuration = PSPDFConfiguration { builder in
      builder.searchResultZoomScale = 1 // this is supposed to disable zoom for search results, but it's not doing that!
      //builder.maximumZoomScale = 1  // this disables zoom altogether
      builder.backgroundColor = UIColor.lightGray
    }

    //let pdfController = PDFViewController(document: document, configuration: configuration)
    let pspdfController = PSPDFViewController(document: document, configuration: configuration)
      pspdfController.view.frame = view.bounds
      pspdfController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      view.addSubview(pspdfController.view)
      pspdfController.didMove(toParentViewController: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}