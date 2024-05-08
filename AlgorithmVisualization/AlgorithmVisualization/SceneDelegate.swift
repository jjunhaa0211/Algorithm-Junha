import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        binarySearch()
    }

    private func stack() {
        window?.rootViewController = UINavigationController(rootViewController: StackViewController())
        window?.makeKeyAndVisible()
    }
    
    private func queue() {
        window?.rootViewController = UINavigationController(rootViewController: QueueViewController())
        window?.makeKeyAndVisible()
    }
    
    private func linkList() {
        window?.rootViewController = UINavigationController(rootViewController: LinkedListViewController())
        window?.makeKeyAndVisible()
    }
    
    private func hashTable() {
        window?.rootViewController = UINavigationController(rootViewController: HashTableViewController())
        window?.makeKeyAndVisible()
    }
    
    private func sha256() {
        window?.rootViewController = UINavigationController(rootViewController: SHA256ViewController())
        window?.makeKeyAndVisible()
    }
    
    private func binarySearch() {
        window?.rootViewController = UINavigationController(rootViewController: BinarySearchViewController())
        window?.makeKeyAndVisible()
    }
}

