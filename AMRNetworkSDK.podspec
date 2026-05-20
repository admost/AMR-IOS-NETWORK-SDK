Pod::Spec.new do |s|
  s.name             = 'AMRNetworkSDK'
  s.version          = '1.0.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage         = 'http://www.admost.com/'
  s.author           = { 'Admost Mediation Limited' => 'amr@admost.com' }
  s.summary          = 'Automatic HTTP network traffic monitoring add-on for AMRSDK.'
  s.description      = <<-DESC
                       AMRNetworkSDK auto-captures HTTP(S) traffic in the host app via NSURLProtocol
                       and NSURLSession swizzling, then forwards each request to AMRSDK for event
                       reporting. Drop-in addition to AMRSDK — no integration code required.
                       DESC

  s.source           = { :git => 'https://github.com/admost/AMR-IOS-NETWORK-SDK.git',
                         :tag => s.version.to_s }
  s.documentation_url = 'https://admost.github.io/amrios/'
  s.platform              = :ios
  s.ios.deployment_target = '13.0'
  s.swift_versions        = ['5']
  s.vendored_frameworks   = 'AMRNetworkSDK/Libs/AMRNetworkSDK.xcframework'
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'VALID_ARCHS' => 'arm64 x86_64',
    'VALID_ARCHS[sdk=iphoneos*]' => 'arm64',
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64 arm64'
  }
  s.dependency 'AMRSDK', '~> 1.5.91'
end
