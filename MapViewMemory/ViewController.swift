//
//  ViewController.swift
//  MapViewMemmory
//
//  Created by Adrian Tofan on 12/07/2016.
//  Copyright © 2016 Adrian Tofan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor()
    srand48(Int(arc4random()))
  }

  var firstLoad = true
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    if firstLoad {
      firstLoad = false
      showMap()
    }
  }

  func showMap()  {
    let mapViewController = MapViewController()
    self.presentViewController(mapViewController, animated: true) { [weak self] in
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)*2), dispatch_get_main_queue(), { [weak self] in
          self?.dismissViewControllerAnimated(true, completion: {[weak self] in
            dispatch_async(dispatch_get_main_queue(), {
              self?.showMap()
            })
          })
      })
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

