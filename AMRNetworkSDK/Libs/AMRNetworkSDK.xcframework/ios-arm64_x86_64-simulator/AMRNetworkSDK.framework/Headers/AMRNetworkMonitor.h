//
//  AMRNetworkMonitor.h
//  AMRNetworkSDK
//
//  Created by Mehmet Karagöz on 20/05/2026.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMRNetworkMonitor : NSObject

+ (NSString *)SDKVersion;

+ (void)start;
+ (void)stop;
+ (BOOL)isRunning;

/// URL host'u verilen suffix ile biten (veya eşit olan) request'leri yakalama.
/// Örn: addIgnoredHostSuffix:@"admost.com" → "events.admost.com", "ssp.admost.com" vb. tümü atlanır.
/// AMRSDK init sırasında kendi endpoint host'larını register etmeli.
+ (void)addIgnoredHostSuffix:(NSString *)hostSuffix;

@end

NS_ASSUME_NONNULL_END
