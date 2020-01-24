//
//  ViewController.swift
//  paymentgateway
//
//  Created by Sagi Harika on 21/01/20.
//  Copyright © 2020 Sagi Harika. All rights reserved.
//

import UIKit
import Razorpay
class ViewController: UIViewController,RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        print("unable to process")
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("payment successful")
    }
    
    var razorpay:Razorpay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay=Razorpay.initWithKey("rzp_live_MWuBuwjcEgv1L4", andDelegate: self)
        // Do any additional setup after loading the view.
    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//    }

    @IBAction func paymentBtn(_ sender: Any) {
        showPaymentForm()    }
     func showPaymentForm(){
        let options: [String:Any] = [
                    "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": "purchase description",
                    "order_id": "order_E7UMQecCAfTfdf",
                    "image": "https://url-to-image.png",
                    "name": "business or product name",
                    "prefill": [
                        "contact": "9797979797",
                        "email": "foo@bar.com"
                    ],
                    "theme": [
                        "color": "#F37254"
                    ]
                ]
        razorpay.open(options)
    }

}

