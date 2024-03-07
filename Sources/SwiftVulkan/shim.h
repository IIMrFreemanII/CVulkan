#include "1.3.211/include/vulkan/vulkan.h"

static uint32_t vkMakeVersion(uint32_t v1, uint32_t v2, uint32_t v3) {
    return VK_MAKE_VERSION(v1, v2, v3);
}

static uint32_t vkMakeApiVersion(uint32_t variant, uint32_t v1, uint32_t v2, uint32_t v3) {
    return VK_MAKE_API_VERSION(variant, v1, v2, v3);
}