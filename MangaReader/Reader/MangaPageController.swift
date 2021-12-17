//
// Created by xiaogd on 2021/12/17.
//

import UIKit
import Foundation

// Represent a page inside UIPageViewController
class MangaPageController: ViewController {
    let pageNumber: Int
    let imageView: UIImageView

    init(page: Int, imgUrl: URL) {
        pageNumber = page
        imageView = UIImageView(image: UIImage(contentsOfFile: imgUrl.path))
        imageView.contentMode = .scaleAspectFit
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .black
        view.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("No going to implement this")
    }

    override func viewDidLoad() {
        imageView.frame = view.frame
    }
}