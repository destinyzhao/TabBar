platform:ios,'13.0'
use_frameworks!
target 'TabBar' do
    pod 'CYLTabBarController'
    pod 'Masonry'
end

post_install do |installer|
            installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end




