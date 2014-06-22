//
//  AppDelegate.swift
//  WorldCup-Swift
//
//  Created by Juliana Chahoud on 6/19/14.
//  Copyright (c) 2014 jchahoud. All rights reserved.
//

/*
In Obj-C:
#import <UIKit/UIKit.h>
*/
import UIKit

/*
"Replace" the main file and UIApplicationMain instance creation
In Obj-C (in main.m):
UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
*/
@UIApplicationMain

/*
In Obj-C:
@interface AppDelegate : UIResponder <UIApplicationDelegate>
*/
class AppDelegate: UIResponder, UIApplicationDelegate {

    /*
    In Obj-C:
    @property (strong, nonatomic) UIWindow *window;
    */
    var window: UIWindow?

    /*
    In Obj-C
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    */
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

