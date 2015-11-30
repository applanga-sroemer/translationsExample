//
//  ElLocoTools.h
//  ElLocoTools
//
//  Copyright © 2013-2015 El Loco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ELXMLWriter;

@interface ElLocoTools : NSObject

+ (NSString *)getAgentPort;
+ (NSString *)getGuid;
+ (UIViewController *)currentViewController;
+ (void)setCurrentViewController:(UIViewController *)viewController;
+ (NSString *)currentViewControllerName;
+ (void)setCurrentViewControllerName:(NSString *)viewControllerName;

+ (CGRect)keyboardBoundsAsRect;
+ (void)setKeyboardBoundsAsRect:(CGRect)boundsAsRect;

+ (BOOL)runningSimulator;
+ (bool)systemVersionLaterThan:(NSString *)version;
+ (int)getObjectId;
+ (int)getTransUnitId;
+ (int)getScreenId;
+ (void)openNewGroupInXlf:(ELXMLWriter *)xlfRoot forView:(UIView *)view;
+ (void)openNewGroupInXlf:(ELXMLWriter *)xlfRoot forClassName:(NSString *)className;
+ (void)closeGroupInXlf:(ELXMLWriter *)xlfRoot;
+ (BOOL)isSegmentLocalizable:(NSString *)md5Segment;
+ (NSArray *)getMatchingSegmentsForMd5:(NSString *)md5Segment;

+ (BOOL)isWebViewInViewController:(UIViewController *)viewController;

+ (BOOL)createXliffAsStringFromViewController:(UIViewController *)viewController withClimbing:(BOOL)bClimb overrideExistingXliff:(BOOL)bOverride;
+ (BOOL)createXliffAsStringFromViewController:(UIViewController *)viewController withClimbing:(BOOL)bClimb overrideExistingXliff:(BOOL)bOverride forceGeneration:(BOOL)bForce addBackground:(BOOL)bBackground;
+ (BOOL)createXliffAsStringFromView:(UIView *)view withClassName:(NSString *)className andOrientation:(UIInterfaceOrientation)interfaceOrientation forceGeneration:(BOOL)bForce viewIsUIWindow:(BOOL)bIsUIWindow;
+ (BOOL)tryGenerateXlfForViewController:(UIViewController *)viewController;
+ (BOOL)tryOverrideXlfForViewController:(UIViewController *)viewController;

//+ (NSString *)md5_scenario3_ofViewController:(UIViewController *)viewController;
+ (void)md5_ofViewController:(UIViewController *)viewController withMd5Structure:(NSMutableString **)md5Structure andMd5Localizables:(NSMutableString **)md5Localizables andMd5NonLocalizables:(NSMutableString **)md5NonLocalizables ignoreObjects:(NSMutableSet **)setOfObjectsVisited;

// public API
+ (void)setupWithGuid:(NSString *)guid;

@end
