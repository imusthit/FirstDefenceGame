//
//  XBridgeViewController.cpp
//  xbridge
//
//  Created by diwwu on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "XBridge.h"
#include "AppController.h"
#include "RootViewController.h"
#include "XBridgeTableViewController.h"
#import "InfiniteScrollPicker.h"
#import "MapSelViewController.h"
#import "StartScene.h"
using namespace cocos2d;

void XBridge::doSth() {
    id sth = [[UIApplication sharedApplication] delegate];
    if ([sth isKindOfClass:[AppController class]]) {
        NSMutableArray *set1 = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 6; i++) {
            [set1 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"map%d.png", i]]];
        }
//       InfiniteScrollPicker* isp = [[InfiniteScrollPicker alloc] initWithFrame:CGRectMake(0, 0, 480, 200)];
//        [isp setItemSize:CGSizeMake(160, 160)];
//        [isp setImageAry:set1];
//        
//        [set1 release];
//        [isp setTag:1015];
//        AppController *controller = (AppController *)sth;
//        [controller.viewController.view addSubview:isp];
//
        MapSelViewController *mapSelViewController = [[MapSelViewController alloc] initWithNibName:@"MapSelViewController" bundle:nil];
        mapSelViewController.view.frame = CGRectMake(0, 0, 320, 480);
        [mapSelViewController.view setTag:1015];
        AppController *controller = (AppController *)sth;
        
        [controller.viewController.view addSubview:mapSelViewController.view];
    }
}
void XBridge::tobackground(){
    id sth = [[UIApplication sharedApplication] delegate];
    AppController *controller = (AppController *)sth;
    for (UIView *view in controller.viewController.view.subviews) {
        if (view.tag==1015) {
            [controller.viewController.view sendSubviewToBack:view];
            break;
        }
    }
}
void XBridge::tofront(){
    id sth = [[UIApplication sharedApplication] delegate];
    AppController *controller = (AppController *)sth;
    for (UIView *view in controller.viewController.view.subviews) {
        if (view.tag==1015) {
            [controller.viewController.view bringSubviewToFront:view];
            break;
        }
    }
}
void XBridge::setCurMap(int cur){
    AppController *controller = (AppController *)[UIApplication sharedApplication ].delegate;
    [controller setCutMap:cur];
   
}
int XBridge::getCurMap(){
    AppController *controller = (AppController *)[UIApplication sharedApplication ].delegate;
    return controller.cutMap;
}
void XBridge::startGameWithMap(){
    XBridge::clearmy();
    StartScene *nowscene = (StartScene*)CCDirector::sharedDirector()->getRunningScene();
    nowscene->startGame();
}
void XBridge::clearmy(){
    id sth = [[UIApplication sharedApplication] delegate];
      AppController *controller = (AppController *)sth;
    for (UIView *view in controller.viewController.view.subviews) {
        if (view.tag==1015) {
            [view removeFromSuperview];
            break;
        }
    }
}