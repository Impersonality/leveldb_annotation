# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/kg/Softwares/clion/clion-2020.1.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/kg/Softwares/clion/clion-2020.1.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kg/Code/cppCode/leveldb_annotation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/arena_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/arena_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/arena_test.dir/flags.make

CMakeFiles/arena_test.dir/util/testharness.cc.o: CMakeFiles/arena_test.dir/flags.make
CMakeFiles/arena_test.dir/util/testharness.cc.o: ../util/testharness.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/arena_test.dir/util/testharness.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/arena_test.dir/util/testharness.cc.o -c /home/kg/Code/cppCode/leveldb_annotation/util/testharness.cc

CMakeFiles/arena_test.dir/util/testharness.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/arena_test.dir/util/testharness.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kg/Code/cppCode/leveldb_annotation/util/testharness.cc > CMakeFiles/arena_test.dir/util/testharness.cc.i

CMakeFiles/arena_test.dir/util/testharness.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/arena_test.dir/util/testharness.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kg/Code/cppCode/leveldb_annotation/util/testharness.cc -o CMakeFiles/arena_test.dir/util/testharness.cc.s

CMakeFiles/arena_test.dir/util/testutil.cc.o: CMakeFiles/arena_test.dir/flags.make
CMakeFiles/arena_test.dir/util/testutil.cc.o: ../util/testutil.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/arena_test.dir/util/testutil.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/arena_test.dir/util/testutil.cc.o -c /home/kg/Code/cppCode/leveldb_annotation/util/testutil.cc

CMakeFiles/arena_test.dir/util/testutil.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/arena_test.dir/util/testutil.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kg/Code/cppCode/leveldb_annotation/util/testutil.cc > CMakeFiles/arena_test.dir/util/testutil.cc.i

CMakeFiles/arena_test.dir/util/testutil.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/arena_test.dir/util/testutil.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kg/Code/cppCode/leveldb_annotation/util/testutil.cc -o CMakeFiles/arena_test.dir/util/testutil.cc.s

CMakeFiles/arena_test.dir/util/arena_test.cc.o: CMakeFiles/arena_test.dir/flags.make
CMakeFiles/arena_test.dir/util/arena_test.cc.o: ../util/arena_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/arena_test.dir/util/arena_test.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/arena_test.dir/util/arena_test.cc.o -c /home/kg/Code/cppCode/leveldb_annotation/util/arena_test.cc

CMakeFiles/arena_test.dir/util/arena_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/arena_test.dir/util/arena_test.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kg/Code/cppCode/leveldb_annotation/util/arena_test.cc > CMakeFiles/arena_test.dir/util/arena_test.cc.i

CMakeFiles/arena_test.dir/util/arena_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/arena_test.dir/util/arena_test.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kg/Code/cppCode/leveldb_annotation/util/arena_test.cc -o CMakeFiles/arena_test.dir/util/arena_test.cc.s

# Object files for target arena_test
arena_test_OBJECTS = \
"CMakeFiles/arena_test.dir/util/testharness.cc.o" \
"CMakeFiles/arena_test.dir/util/testutil.cc.o" \
"CMakeFiles/arena_test.dir/util/arena_test.cc.o"

# External object files for target arena_test
arena_test_EXTERNAL_OBJECTS =

arena_test: CMakeFiles/arena_test.dir/util/testharness.cc.o
arena_test: CMakeFiles/arena_test.dir/util/testutil.cc.o
arena_test: CMakeFiles/arena_test.dir/util/arena_test.cc.o
arena_test: CMakeFiles/arena_test.dir/build.make
arena_test: libleveldb.a
arena_test: CMakeFiles/arena_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable arena_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/arena_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/arena_test.dir/build: arena_test

.PHONY : CMakeFiles/arena_test.dir/build

CMakeFiles/arena_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/arena_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/arena_test.dir/clean

CMakeFiles/arena_test.dir/depend:
	cd /home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kg/Code/cppCode/leveldb_annotation /home/kg/Code/cppCode/leveldb_annotation /home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug /home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug /home/kg/Code/cppCode/leveldb_annotation/cmake-build-debug/CMakeFiles/arena_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/arena_test.dir/depend

