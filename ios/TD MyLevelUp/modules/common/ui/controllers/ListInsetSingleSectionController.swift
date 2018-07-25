import UIKit
import IGListKit

final class ListInsetSingleSectionController: ListSingleSectionController {
    typealias InsetBlock = (_ item: Any, _ context: ListCollectionContext?) -> UIEdgeInsets
    
    private let insetBlock: InsetBlock
    private var item: Any?
    
    init(storyboardCellIdentifier identifier: String, configureBlock: @escaping ListSingleSectionCellConfigureBlock, sizeBlock: @escaping ListSingleSectionCellSizeBlock, insetBlock: @escaping InsetBlock) {
        self.insetBlock = insetBlock
        super.init(storyboardCellIdentifier: identifier, configureBlock: configureBlock, sizeBlock: sizeBlock)
    }
    
    init(nibName: String, bundle: Bundle?, configureBlock: @escaping ListSingleSectionCellConfigureBlock, sizeBlock: @escaping ListSingleSectionCellSizeBlock, insetBlock: @escaping InsetBlock) {
        self.insetBlock = insetBlock
        super.init(nibName: nibName, bundle: bundle, configureBlock: configureBlock, sizeBlock: sizeBlock)
    }
    
    init(cellClass: AnyClass, configureBlock: @escaping ListSingleSectionCellConfigureBlock, sizeBlock: @escaping ListSingleSectionCellSizeBlock, insetBlock: @escaping InsetBlock) {
        self.insetBlock = insetBlock
        super.init(cellClass: cellClass, configureBlock: configureBlock, sizeBlock: sizeBlock)
    }
    
    override var inset: UIEdgeInsets {
        set {
            fatalError("insets are determined dynamically")
        }
        get {
            if let item = item {
                return insetBlock(item, self.collectionContext)
            } else {
                return .zero
            }
        }
    }
    
    override func didUpdate(to object: Any) {
        super.didUpdate(to: object)
        item = object
    }
}
