cmake_minimum_required(VERSION 3.15...4.0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -O3 -s")

project(
  tripe
  VERSION 1.0
  LANGUAGES CXX)

#add_library(MyLibExample simple_lib.cpp simple_lib.hpp)

# Link each target with other targets or add options, etc.

# Adding something we can run - Output name matches target name
add_executable(tripe
  src/abstractcpu.cpp
  src/cpu6502.cpp
  src/data.cpp
  src/error.cpp
  src/main.cpp
  src/opcodes.cpp
  src/parser.cpp
  src/opts/phopt.cpp
  src/opts/tropt.cpp
  src/opts/phopt6502.cpp
  src/util.cpp
  src/tripe.cpp
  
)


target_include_directories(tripe PRIVATE 
  src/
  src/opts
  src/resources
)


# Make sure you link your targets with this command. It can also link libraries and
# even flags, so linking a target that does not exist will not give a configure-time error.
#target_link_libraries(tripe PRIVATE ncurses)
