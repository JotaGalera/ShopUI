platform :ios, '13.0'

#**Pods**
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
end

target 'ShopUITests' do
    use_frameworks!
    default_pods
    snapshot_testing
end

target 'ShopUIUITests' do
end

