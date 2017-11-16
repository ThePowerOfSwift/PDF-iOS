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
//public class PDFViewController: PSPDFViewController {

  var documentName = "FinancialAccounting"
  //var pspdfController: PSPDFViewController? = nil
  var pspdfController: PSPDFKitViewController? = nil
  var document: PSPDFDocument?
  var configuration: PSPDFConfiguration?


  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)

  PSPDFKit.setLicenseKey("ayMdJS9o1bNAIcD2RRW4EBCT8kIbBAMIQOzZ+AuONFXi3AiEMHRcpVB7tOLb0ocsbu2+EJopWzHGHWE5sYEW0yVGpQR7N18+pijQUCwd0mF9jVBARvqviQl0bNlF9neeMDJWC4M7PXkfUjshPo7d2AZcwQgq8L8v2yZEpqGgzUq8xJwBI/xjhi6gjoazNJ+XHad91vxcfF60mrYDh9mIRcgAIdnI5IHy4w7pYV6w5wx3KftFTMYbQki1h298jARu3sHhecN58Y2MjsxMvo8cDsIMBUbGr/uqI9+jydXOf/eHw+qdYxqszCjPV5myMvUyIYpYGWkVwx+APcN6Z4+58qh0qAxf9n+LuS6UtKft/4FvQE8R7hvqePFfPTuu77sIWVAWzpYaw8d+rpXkcPs7yGZTImjeaxy+IkJZP5+jYne/6zPp7mMO1ma634ErcP0H")

  }


  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func viewDidLoad() {
    super.viewDidLoad()
  //override public func viewDidAppear(_ animated: Bool) {

  //  super.viewDidAppear(animated)

    //PSPDFKit.setLicenseKey("ayMdJS9o1bNAIcD2RRW4EBCT8kIbBAMIQOzZ+AuONFXi3AiEMHRcpVB7tOLb0ocsbu2+EJopWzHGHWE5sYEW0yVGpQR7N18+pijQUCwd0mF9jVBARvqviQl0bNlF9neeMDJWC4M7PXkfUjshPo7d2AZcwQgq8L8v2yZEpqGgzUq8xJwBI/xjhi6gjoazNJ+XHad91vxcfF60mrYDh9mIRcgAIdnI5IHy4w7pYV6w5wx3KftFTMYbQki1h298jARu3sHhecN58Y2MjsxMvo8cDsIMBUbGr/uqI9+jydXOf/eHw+qdYxqszCjPV5myMvUyIYpYGWkVwx+APcN6Z4+58qh0qAxf9n+LuS6UtKft/4FvQE8R7hvqePFfPTuu77sIWVAWzpYaw8d+rpXkcPs7yGZTImjeaxy+IkJZP5+jYne/6zPp7mMO1ma634ErcP0H")
    // Do any additional setup after loading the view.
    //view.backgroundColor = UIColor.lightGray

    //let fileURL = Bundle.main.url(forResource: documentName, withExtension: "pdf")!
    let fileURL = Bundle(identifier: "edu.umn.minitex.simplye.PDF")?.url(forResource: documentName, withExtension: "pdf")
    document = PSPDFDocument(url: fileURL!)

     configuration = PSPDFConfiguration { builder in
      builder.searchResultZoomScale = 1 
      builder.backgroundColor = UIColor.lightGray

    }

    //self.document = document
    //self.configuration = configuration


    //let pspdfController = PSPDFViewController(document: document, configuration: configuration)
    pspdfController = PSPDFKitViewController(document: document, configuration: configuration)


    //pspdfController = PSPDFViewController(document: document, configuration: configuration)
    pspdfController?.view.frame = view.bounds
    pspdfController?.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    /*
      view.addSubview(pspdfController.view)
      pspdfController.didMove(toParentViewController: self)


    var topViewController = UIApplication.shared.keyWindow?.rootViewController
    topViewController?.present(pspdfController, animated: false, completion: nil)
 */
    //self.navigationController?.present(pspdfController, animated: false, completion: nil)
    //self.present(pspdfController, animated: false, completion: nil)
  }

  public func presentPSPDFView() {
    //let pspdfController = PSPDFViewController(document: document, configuration: configuration)
    //let pspdfController = PSPDFKitViewController(document: document, configuration: configuration)

    pspdfController = PSPDFKitViewController(document: document, configuration: configuration)


    //pspdfController = PSPDFViewController(document: document, configuration: configuration)
    pspdfController?.view.frame = view.bounds
    pspdfController?.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //pspdfController.view.frame = view.bounds
    //pspdfController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview((pspdfController?.view)!)
    pspdfController?.didMove(toParentViewController: self)

  }
}

   
