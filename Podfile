platform :ios, '13.0'
 
 use_frameworks!
 
# Pods for OnoKit

def basePods

  # Core

  pod 'ObjectMapper', '~> 4.2.0'

  # UI

  pod 'SnapKit', '~> 5.6.0'
  
  # Util
  
  pod 'KeychainAccess', '~> 4.2.2'
  pod 'SwiftLint', '~> 0.49.1'

end
  
target 'OnoKit' do
  basePods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

