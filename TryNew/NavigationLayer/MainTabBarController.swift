import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController, favouriteViewController, settingsViewController]
    }
    
}

extension MainTabBarController {
    
    private var homeViewController: UIViewController {
        let homeView = HomeView()
        let homeHostingController = UIHostingController(rootView: homeView)
        homeHostingController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        return homeHostingController
    }
    
    private var favouriteViewController: UIViewController {
        let favouriteView = FavouriteView()
        let favouriteHostingController = UIHostingController(rootView: favouriteView)
        favouriteHostingController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        return favouriteHostingController
    }
    
    private var settingsViewController: UIViewController {
        let settingsView = SettingsView()
        let settingsHostingController = UIHostingController(rootView: settingsView)
        settingsHostingController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"))
        return settingsHostingController
    }
    
}
