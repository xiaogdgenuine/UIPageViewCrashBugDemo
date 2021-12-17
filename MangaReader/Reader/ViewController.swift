//
//  ViewController.swift
//  MangaReader
//
//  Created by xiaogd on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {
    var currentPage = 0
    var pageViewController: UIPageViewController!
    var allMangaImageUrls: [URL] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewController()
        setupMangaSource()
    }

    // Setup a "one page + curling effect + full screen" UIPageViewController
    func setupPageViewController() {
        let spineLocation = UIPageViewController.SpineLocation.min.rawValue
        pageViewController = UIPageViewController(transitionStyle: .pageCurl,
                navigationOrientation: .horizontal,
                options: [UIPageViewController.OptionsKey.spineLocation: spineLocation])
        pageViewController.isDoubleSided = false
        pageViewController.dataSource = self
        pageViewController.delegate = self

        addChild(pageViewController)
        view.addSubview(pageViewController!.view)
        pageViewController.view.frame = view.frame
    }

    func setupMangaSource() {
        if let sampleFilesFolderUrl = Bundle.main.resourceURL?.appendingPathComponent("Images", isDirectory: true) {
            allMangaImageUrls = (try? FileManager.default.contentsOfDirectory(at: sampleFilesFolderUrl, includingPropertiesForKeys: nil)) ?? []
            allMangaImageUrls.sort { $0.lastPathComponent.localizedCaseInsensitiveCompare($1.lastPathComponent) == .orderedAscending }
            pageViewController.setViewControllers([MangaPageController(page: 0, imgUrl: allMangaImageUrls[0])], direction: .forward, animated: true)
        }
    }

    // Resize UIPageViewController when rotating device
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: nil) { _ in
            self.pageViewController?.view.removeFromSuperview()
            self.pageViewController?.removeFromParent()
            self.setupPageViewController()
        }
    }
}

