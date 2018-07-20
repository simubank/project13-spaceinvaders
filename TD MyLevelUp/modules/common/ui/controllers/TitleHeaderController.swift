//
//  HDTitleHeaderSectionController.swift
//
//  Copyright (c) 2017 Herzberg Labs
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import IGListKit

open class TitleHeaderController: ListSectionController {
    private var object: String?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: TitleHeaderCell.preferredHeight(maxWidth: collectionContext.containerSize.width, message: object ?? ""))
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: TitleHeaderCell.self, for: self, at: index) as? TitleHeaderCell else {
            fatalError()
        }
        cell.titleLabel.text = object
        return cell
    }
    
    open override func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
    open override func didSelectItem(at index: Int) {
        
    }
}
