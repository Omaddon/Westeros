//
//  AppDelegate.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 5/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Creamos los controladores
        let dataSourceHouse = DataSources.houseDataSource(model: houses)
        let navHouse = UINavigationController()
        let delegateHouse = Delegates.housesDelegate(model: houses, nav: navHouse)
        let housesVC = ArrayTableViewController(dataSource  : dataSourceHouse,
                                                delegate    : delegateHouse,
                                                title       : "Westeros",
                                                style       : .plain)
        
        navHouse.pushViewController(housesVC, animated: true)
//        navHouse.tabBarItem.image = UIImage(named: "houses.jpg")
        
        
        let dataSourceSeason = DataSources.seasonDataSource(model: seasons)
        let navSeason = UINavigationController()
        let delegateSeason = Delegates.seasonDelegate(model: seasons, nav: navSeason)
        let seasonVC = ArrayTableViewController(dataSource  : dataSourceSeason,
                                                delegate    : delegateSeason,
                                                title       : "Seasons",
                                                style       : .plain)
        
        navSeason.pushViewController(seasonVC, animated: true)
//        navSeason.tabBarItem.image = UIImage(named: "westeros.png")
        
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [navSeason, navHouse]
//        UINavigationController().pushViewController(tabBar, animated: true)
        
        
        // Asignamos el rootVC
        window?.rootViewController = tabBar
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

