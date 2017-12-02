#define COMPONENT Artillery_Computer
#define COMPONENT_BEAUTIFIED Artillery Computer
#include "\z\acex_artillery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ARTILLERY_COMPUTER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ARTILLERY_COMPUTER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ARTILLERY_COMPUTER
#endif

#include "\z\acex_artillery\addons\main\script_macros.hpp"