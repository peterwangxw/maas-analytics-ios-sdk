Pod::Spec.new do |s|
  s.name     = 'Beta'
  s.version  = '3.1.0'
  s.license  = 'MIT'
  s.summary  = 'Phunware SDK (BETA)'
  s.homepage = 'https://github.com/phunware/beta'
  s.authors  = { 'Phunware' => 'info@phunware.com' }
  s.source   = { :git => 'https://github.com/xwang-phunware/maas-analytics-ios-sdk.git', :branch => 'beta' }
  s.requires_arc = true
  
  s.ios.deployment_target = '9.0'  
  s.default_subspec = 'PWCore'

  s.subspec 'PWCore' do |core|
  	core.ios.vendored_frameworks = 'Framework/PWCore.framework'
		core.ios.frameworks = 'Security', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony'
		core.libraries = 'z', 'xml2.2'
		core.ios.dependency 'SSZipArchive'
  end

  s.subspec 'PWLocation' do |location|
    location.ios.vendored_frameworks = 'Framework/PWLocation.framework'
  	location.dependency 'Beta/PWCore'
	  location.dependency 'MistSDK'

  	location.ios.library = 'c++'
	  location.ios.frameworks = 'Security', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony', 'CoreBluetooth', 'CoreMotion', 'CoreLocation', 'MapKit'
  	location.library = 'sqlite3', 'z', 'xml2.2'
  end

	s.subspec 'PWMapKit' do |mapkit|
    mapkit.ios.vendored_frameworks = 'Framework/PWMapKit.framework'
	  mapkit.ios.dependency 'Beta/PWLocation'
  	mapkit.ios.frameworks = 'Security', 'CoreGraphics', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony', 'CoreLocation', 'MapKit'
  end

end