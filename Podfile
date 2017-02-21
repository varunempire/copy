platform :ios, '9.0'
use_frameworks!

def sharedPods
    pod 'FBSDKCoreKit', '~> 4.18'
    pod 'FBSDKLoginKit', '~> 4.18'
    pod 'FBSDKShareKit', '~> 4.18'
    pod 'SwiftyDropbox'
    pod 'Sharaku'
    pod 'PathMenu'
    pod 'Fabric'
    pod 'TwitterKit'
    pod 'TwitterCore'
end

target 'Moments' do
    sharedPods
    
    target 'MomentsTests' do
        inherit! :search_paths
    end
    
    target 'MomentsUITests' do
        inherit! :search_paths
    end
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
        end
    end
end
