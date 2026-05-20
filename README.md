# AMR-IOS-NETWORK-SDK

[![Version](https://img.shields.io/cocoapods/v/AMRNetworkSDK.svg?style=flat)](https://cocoapods.org/pods/AMRNetworkSDK)
[![License](https://img.shields.io/cocoapods/l/AMRNetworkSDK.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/AMRNetworkSDK.svg?style=flat)](https://cocoapods.org/pods/AMRNetworkSDK)

Automatic HTTP network traffic monitoring add-on for [AMRSDK](https://github.com/admost/AMR-IOS-SDK).

AMRNetworkSDK auto-captures every HTTP(S) request made by the host app — including third-party SDKs — and forwards them to AMRSDK for event reporting. No integration code required: drop it in, and AMRSDK starts the monitor automatically when network tracking is enabled in your dashboard.

## Requirements

- iOS 13.0+
- Xcode 14+
- AMRSDK 1.5.91 or later

## How it works

- Registers a global `NSURLProtocol` to intercept `URLSession` traffic.
- Swizzles `NSURLSession.session(configuration:)` (and the delegate variant) to inject the protocol into ephemeral / custom configurations.
- Forwards each captured request — URL, method, status code, duration, request/response payload sizes, error — to `AMRSDK.trackHTTPRequest(...)`.
- Filters out AMRSDK's own outbound traffic (`admost.com` and subdomains) to avoid recursion.

Background `URLSession`s are not intercepted — iOS does not honor `NSURLProtocol` for background sessions.

## Installation

### CocoaPods

```ruby
pod 'AMRNetworkSDK'
```

### Swift Package Manager

In Xcode: `File → Add Packages…` and enter:

```
https://github.com/admost/AMR-IOS-NETWORK-SDK
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/admost/AMR-IOS-NETWORK-SDK", from: "1.0.0")
]
```

## Usage

No code changes required. After `AMRSDK.start(...)`, the monitor starts automatically when both `EventsActive` and `AutoNetworkTrackerEnabled` are enabled in your Admost dashboard.

To check whether it's running:

```objc
#import <AMRNetworkSDK/AMRNetworkSDK.h>

if ([AMRNetworkMonitor isRunning]) {
    NSLog(@"Network monitor v%@ is active", [AMRNetworkMonitor SDKVersion]);
}
```

### Disabling

Network tracking can be toggled remotely without an app release — flip the `AutoNetworkTrackerEnabled` flag in the Admost dashboard. Disabling `EventsActive` also stops the monitor.

To stop in code:

```objc
[AMRNetworkMonitor stop];
```

### Ignoring additional hosts

```objc
[AMRNetworkMonitor addIgnoredHostSuffix:@"example.com"];
```

Matches `example.com` and any subdomain (`api.example.com`, `cdn.example.com`).

## License

MIT — see [LICENSE](LICENSE).
