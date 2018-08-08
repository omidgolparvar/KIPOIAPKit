Pod::Spec.new do |s|
  s.name                  = 'KIPOIAPKit'
  s.version               = '0.0.2'
  s.summary               = 'KipoPay In-App Purchase framework for iOS.'
  s.description           = <<-DESC
                            Written in Swift.
                            KipoPay In-App Purchase framework for iOS.
                            DESC
  s.homepage              = 'https://github.com/omidgolparvar/KIPOIAPKit'
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author                = { 'Omid Golparvar' => 'iGolparvar@gmail.com' }
  s.source                = { :git => "https://github.com/omidgolparvar/KIPOIAPKit.git", :tag => s.version.to_s }
  s.swift_version         = '4.0'
  s.platform              = :ios, '10.0'
  s.requires_arc          = true
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.0' }

  s.source_files          = [
    'KIPOIAPKit/*.{h,swift}',
    'KIPOIAPKit/**/.swift'
  ]
  s.public_header_files   = 'KIPOIAPKit/*.h'
#  s.vendored_frameworks   = 'KIPOIAPKit.framework'

  s.libraries  = "z"

end
