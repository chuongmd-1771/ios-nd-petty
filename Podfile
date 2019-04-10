# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Petty' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Petty
pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'SVProgressHUD'
pod 'Reusable'

end
  post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
      configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
      inhibit_all_warnings!
    end
  end
