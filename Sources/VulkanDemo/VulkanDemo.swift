import CVulkan

@main
struct App {
  static func main() {
    // var appInfo = VkApplicationInfo()
    // appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO
    // appInfo.pApplicationName = "Hello Vulkan".withCString { $0 }
    // appInfo.applicationVersion = vkMakeVersion(1, 0, 0)
    // appInfo.pEngineName = "No Engine".withCString { $0 }
    // appInfo.engineVersion = vkMakeVersion(1, 0, 0)
    // appInfo.apiVersion = vkMakeApiVersion(0, 1, 0, 0)

    // var createInfo = VkInstanceCreateInfo()
    // createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
    // createInfo.pApplicationInfo = withUnsafePointer(to: &appInfo) { $0 }
    // createInfo.flags |= VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR.rawValue

    // var instance: VkInstance?
    // if vkCreateInstance(&createInfo, nil, &instance) != VK_SUCCESS {
    //     fatalError("Failed to create Vulkan instance!")
    // }

    // Query the number of available instance extensions
    var extensionCount: UInt32 = 0
    vkEnumerateInstanceExtensionProperties(nil, &extensionCount, nil)

    print("Extension count: \(extensionCount)")

    // Allocate memory for the extensions
    let extensions = UnsafeMutablePointer<VkExtensionProperties>.allocate(capacity: Int(extensionCount))
    defer {
        extensions.deallocate()
        print("deallocate extensions")
    }
    vkEnumerateInstanceExtensionProperties(nil, &extensionCount, extensions)

    // Print the available extensions
    for i in 0..<Int(extensionCount) {
        let extensionName = withUnsafePointer(to: &extensions[i].extensionName) {
            $0.withMemoryRebound(to: CChar.self, capacity: Int(VK_MAX_EXTENSION_NAME_SIZE)) {
                String(cString: $0)
            }
        }
        print("Extension \(i): \(extensionName)")
    }

    // Clean up
    // vkDestroyInstance(instance, nil)
  }
}