//
//  SingleViewImageController.swift
//  ImageFeed
//
//  Created by Kirill Sklyarov on 20.12.2023.
//

import UIKit

final class SingleViewImageController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func sharingAction(_ sender: Any) {
        
        let items: [UIImage] = [image]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityController, animated: true)
    }
    
    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        rescaleAndCenterImageInScrollView(image: image)
    }
}


extension SingleViewImageController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension SingleViewImageController {
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, max(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }
}
