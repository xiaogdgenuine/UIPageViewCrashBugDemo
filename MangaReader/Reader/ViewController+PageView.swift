//
// Created by xiaogd on 2021/12/17.
//

import UIKit
import Foundation

extension ViewController: UIPageViewControllerDataSource {
    func getMangaPage(_ pageNumber: Int) -> MangaPageController? {
        if pageNumber >= 0 && pageNumber < allMangaImageUrls.count {
            return MangaPageController(page: pageNumber, imgUrl: allMangaImageUrls[pageNumber])
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentMangaVC = viewController as? MangaPageController else {
            return nil
        }

        return getMangaPage(currentMangaVC.pageNumber - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentMangaVC = viewController as? MangaPageController else {
            return nil
        }

        return getMangaPage(currentMangaVC.pageNumber + 1)
    }
}

extension ViewController: UIPageViewControllerDelegate {
}
