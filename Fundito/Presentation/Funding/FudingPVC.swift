//
//  FundingPVC.swift
//  Fundito
//
//  Created by kimhyeji on 12/30/19.
//  Copyright © 2019 Fundito. All rights reserved.
//

/**
 NOT USE
 */

import UIKit

class FundingPVC: UIPageViewController {

    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.FundingViewController("Input"),
            self.FundingViewController("Progress"),
            self.FundingViewController("Complete")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: false,
                               completion: nil)}
        print(orderedViewControllers.endIndex)
        
    }
    
    private func FundingViewController(_ step: String) -> UIViewController {
        print("Funding\(step)VC")
        return UIStoryboard(name: "Funding", bundle: nil) .
            instantiateViewController(withIdentifier: "Funding\(step)VC")
        
    }

}

extension FundingPVC: UIPageViewControllerDataSource {
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
//            return orderedViewControllers.last
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
//        return self
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Returns the view controller after the given view controller.
        guard let viewControllerIndex = orderedViewControllers.lastIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
//            return orderedViewControllers.first
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
//                return self
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
}
