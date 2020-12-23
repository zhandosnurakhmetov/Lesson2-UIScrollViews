//
//  PhotoGalleryPageViewController.swift
//  Lesson2-UIScrollView
//
//  Created by admin on 12/22/20.
//

import SnapKit

final class PhotoGalleryPageViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.zoomScale = 1
        return scrollView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "picture")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureImageView()
    }

    private func configureScrollView() {
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureImageView() {
        scrollView.addSubview(imageView)
        let size = getImageSize(image: imageView.image)
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(size.width)
            $0.height.equalTo(size.height)
        }
    }

    private func getImageSize(image: UIImage?) -> CGSize {
        let maxHeight = view.frame.height
        let maxWidth = view.frame.width

        guard let image = image else { return .zero }
        var imageWidth = image.size.width * image.scale
        var imageHeight = image.size.height * image.scale

        let isWidthGreaterThanMaxWidth = imageWidth > maxWidth
        let isHeightGreaterThanMaxHeight = imageHeight > maxHeight

        if isWidthGreaterThanMaxWidth && isHeightGreaterThanMaxHeight {
            var delta: CGFloat
            if imageWidth == imageHeight {
                delta = maxWidth / imageWidth
            } else {
                delta = imageWidth > imageHeight ? maxWidth / imageWidth : maxHeight / imageHeight
            }
            imageWidth = imageWidth * delta
            imageHeight = imageHeight * delta
        } else if isWidthGreaterThanMaxWidth {
            let delta = maxWidth / imageWidth
            imageWidth = imageWidth * delta
            imageHeight = imageHeight * delta
        } else if isHeightGreaterThanMaxHeight {
            let delta = maxHeight / imageHeight
            imageWidth = imageWidth * delta
            imageHeight = imageHeight * delta
        }

        return CGSize(width: imageWidth, height: imageHeight)
    }
}

extension PhotoGalleryPageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
