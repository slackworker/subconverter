foreach(opt TOML11_INCLUDEDIR)
  if(${opt} AND DEFINED ENV{${opt}} AND NOT ${opt} STREQUAL "$ENV{${opt}}")
    message(WARNING "Conflicting ${opt} values: ignoring environment variable and using CMake cache entry.")
  elseif(DEFINED ENV{${opt}} AND NOT ${opt})
    set(${opt} "$ENV{${opt}}")
  endif()
endforeach()

find_path(
  TOML11_INCLUDE_DIRS
  NAMES toml.hpp toml11/toml.hpp
  PATHS ${TOML11_INCLUDEDIR}
  DOC "Include directory for the toml11 headers."
)

mark_as_advanced(TOML11_INCLUDE_DIRS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  toml11
  REQUIRED_VARS TOML11_INCLUDE_DIRS
  FAIL_MESSAGE "Could not find toml11 headers. Install libtoml11-dev or set TOML11_INCLUDEDIR/TOML11_INCLUDE_DIRS."
)