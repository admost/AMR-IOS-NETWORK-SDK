# Changelog

## 1.0.1

- Fix: Unity (and other early-startup hosts) requests are now captured. NSURLProtocol class is registered in `+load` so the host process's pre-init NSURLSession instances also include our protocol in their `protocolClasses`. Actual interception still gated on `AMRNetworkMonitor.start` via `canInitWithRequest:`.
- Self-filter for `admost.com` is now seeded in `+load`, protecting AMRSDK's own traffic even before its init runs.
- Bumped AMRSDK dependency to 1.5.92 (track API + lifecycle events).

## 1.0.0

- Initial release.
- Automatic HTTP(S) traffic capture via `NSURLProtocol` + `NSURLSession` swizzling.
- Forwards captured requests to AMRSDK (`trackHTTPRequest`).
- Self-filter: AMRSDK's own outbound traffic (`admost.com` and subdomains) is excluded.
- Public API: `AMRNetworkMonitor.start / stop / isRunning / addIgnoredHostSuffix: / SDKVersion`.
