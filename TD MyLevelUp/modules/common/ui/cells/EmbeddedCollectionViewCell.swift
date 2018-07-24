/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

/// A Cell with an embedded Horizontal Collection View.
public class EmbeddedCollectionViewCell: TDBaseCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .background
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.pageIndicatorTintColor = UIColor.primaryLight.withAlphaComponent(0.3)
        view.currentPageIndicatorTintColor = .primaryLight
        self.contentView.addSubview(view)
        return view
    }()
    public override func prepareViews() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        pageControl.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.bottom.equalTo(8)
            $0.centerX.equalToSuperview()
        }
    }
}
