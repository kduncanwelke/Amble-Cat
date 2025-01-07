# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Micro Kitty' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Micro Kitty, formerly Amble Cat
  
  pod 'OpenSSL-Universal'

post_install do |installer|

 bitcode_strip_path = `xcrun --find bitcode_strip`.chop!
   def strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
     framework_path = File.join(Dir.pwd, framework_relative_path)
     command = "#{bitcode_strip_path} #{framework_path} -r -o #{framework_path}"
     puts "Stripping bitcode: #{command}"
     system(command)
   end

   framework_paths = [
     "Pods/OpenSSL-Universal/Frameworks/OpenSSL.xcframework/ios-arm64/OpenSSL.framework/OpenSSL",
     "Pods/OpenSSL-Universal/Frameworks/OpenSSL.xcframework/ios-arm64_x86_64-simulator/OpenSSL.framework/OpenSSL"
   ]

   framework_paths.each do |framework_relative_path|
     strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
   end
end
end
