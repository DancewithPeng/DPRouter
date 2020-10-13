#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Module.h"
#import "ModuleBusBridge.h"
#import "ModuleManager.h"
#import "ModuleManagerInternal.h"
#import "UIApplication+ModuleManager.h"

FOUNDATION_EXPORT double DPModuleManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char DPModuleManagerVersionString[];

