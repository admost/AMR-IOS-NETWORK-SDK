# Changelog

## 1.0.0

- Initial release.
- Automatic HTTP(S) traffic capture via `NSURLProtocol` + `NSURLSession` swizzling.
- Forwards captured requests to AMRSDK (`trackHTTPRequest`).
- Self-filter: AMRSDK's own outbound traffic (`admost.com` and subdomains) is excluded.
- Public API: `AMRNetworkMonitor.start / stop / isRunning / addIgnoredHostSuffix: / SDKVersion`.
