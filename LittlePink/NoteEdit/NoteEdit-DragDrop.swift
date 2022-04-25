//
//  NoteEdit-DragDrop.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/25.
//

import Foundation

// MARK: - UICollectionViewDragDelegate
extension NoteEditVC: UICollectionViewDragDelegate {
    
    // 1. 開始拖曳先觸發這
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        // 可用IndexPath 判斷某 section 或 item 是否可拖動，若不可拖動，可以返回空數組
        let photo = photos[indexPath.item]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: photo))
        dragItem.localObject = photo
        
        return [dragItem]
    }
    
    
}

// MARK: - UICollectionViewDropDelegate
extension NoteEditVC: UICollectionViewDropDelegate {
    
    // 2. 拖曳中執行，加這行function會優化拖曳效率，在這邊判斷是 move / copy / forbidden
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    // 3. 拖曳結束，觸發這裡
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        // 判斷是 move mode 再執行
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath,
           let destinationIndexPath = coordinator.destinationIndexPath
        {
            // 要加 perforomBatchUpdates 做 insert delete reload
            collectionView.performBatchUpdates {
                // 重新調整photos位置，刪除再insert
                photos.remove(at: sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
                
            }
            // 要加這行才會有拖曳動畫效果
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
    
    
}
