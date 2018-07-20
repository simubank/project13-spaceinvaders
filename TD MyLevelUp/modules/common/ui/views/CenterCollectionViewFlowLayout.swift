import UIKit

class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var mostRecentOffset: CGPoint = CGPoint.zero
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if velocity.x == 0 {
            return self.mostRecentOffset
        }
        
        guard let cv = self.collectionView,
            let attributesForVisibleCells = self.layoutAttributesForElements(in: cv.bounds) else {
                // Fallback
                self.mostRecentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
                return self.mostRecentOffset
        }
        
        let halfWidth = cv.bounds.size.width * 0.5
        
        var candidateAttributes: UICollectionViewLayoutAttributes?
        for attributes in attributesForVisibleCells {
            
            // Skip comparison with non-cell items (headers and footers)
            if attributes.representedElementCategory != UICollectionElementCategory.cell {
                continue
            }
            
            if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
                continue
            }
            
            candidateAttributes = attributes
        }
        
        // Beautification step , I don't know why it works!
        if proposedContentOffset.x == -(cv.contentInset.left) {
            return proposedContentOffset
        }
        
        guard let attributes = candidateAttributes else {
            return mostRecentOffset
        }
        
        self.mostRecentOffset = CGPoint(x: floor(attributes.center.x - halfWidth), y: proposedContentOffset.y)
        
        return self.mostRecentOffset
    }
}
