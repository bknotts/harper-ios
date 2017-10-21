//
//  GameContentPageViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/20/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class GameContentPageViewController: UIPageViewController {

    
    // Create array of view controllers
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newContentSlideViewController(),
                self.newContentSlideViewController(),
                self.newContentSlideViewController()]
    }()
    
    private func newContentSlideViewController() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "ContentSlideViewController")
    }
    
    // I *think* ^^ should give us three instances of the ContentSlideViewController
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        // Load the first view controller
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


// MARK: - UIPageViewControllerDataSource
// TODO: Find out why an extension and not up in the class itself?
extension GameContentPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
    }

}
