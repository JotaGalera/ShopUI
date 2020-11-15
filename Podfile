platform :ios, '13.0'

#**Pods**

def alamofire
    pod 'Alamofire'
end

def default_pods 
    pod 'Sourcery'
end

def snapshot_testing
    pod 'SnapshotTesting'
end

#**Targets**
target 'ShopUI' do
    use_frameworks!
    default_pods
    alamofire
end

target 'ShopUITests' do
    use_frameworks!
    default_pods
    snapshot_testing
    alamofire
end

target 'ShopUIUITests' do
end

