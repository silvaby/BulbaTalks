import UIKit

/**
 Provides the ability to register and dequeue the cell
 available to be reused, placed into a queue
 when the cell scrolls off the screen.
 */
extension UITableView {
    /**
     Loads the cell from the xib resource file and
     registers it with the table view.
     The xib file should be in the main bundle.
     - Parameter typeCell: The class type of the cell to register.
     */
    func registerCell<T: UITableViewCell>(of typeCell: T.Type) {
        let nibFileWithCell = UINib(nibName: typeCell.reuseIdentifier, bundle: nil)
        register(nibFileWithCell, forCellReuseIdentifier: typeCell.reuseIdentifier)
    }

    /**
     Dequeues an existing available cell or creates
     a new one using the class or nib file you previously registered.
     A queue used to store table view cells and is created
     when register a cell for a table view.
     A queue is stored in memory.
     When the cell scrolls off the screen, it'll be placed into a queue
     of the specified type cells available to be reuse.
     - Parameter typeCell: The class type of the cell to dequeue.
     - Returns: The reusable cell or `nil` if no cell is available
     for reuse and you did not register a class or nib file.
     */
    func dequeueCell<T: UITableViewCell>(of typeCell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: typeCell.reuseIdentifier) as? T
    }
}
