import UIKit

extension Bundle {
    /**
     Returns the contents of the file from the current bundle.
     - Parameter fileURL: The path to the file.
     - Returns: The `Data` object with the contents of the file.

        If an invalid URL was provided or the file could not be located
        at the given URL or it is impossible to construct a `Data` object,
        the method returns `nil`.
     */
    func contentsOfFile(at fileURL: URL) -> Data? {
        guard let url = url(forResource: fileURL.lastPathComponent,
                            withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }

    /**
     Gets the image from the current bundle.
     - Parameter url: URL of the image within the bundle.
     - Parameter completion: A completion
     handler which takes the image from the given URL
     or `nil` if the image couldn't be found in the bundle.
     */
    func getImage(at url: URL, completion: (UIImage?) -> Void) {
        guard let data = contentsOfFile(at: url),
            let image = UIImage(data: data) else {
            completion(nil)
            return
        }
        completion(image)
    }
}
