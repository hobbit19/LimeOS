# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/Documents/Code/LimeOS

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/Documents/Code/LimeOS/build

# Utility rule file for iso.

# Include the progress variables for this target.
include CMakeFiles/iso.dir/progress.make

CMakeFiles/iso:
	cp ../bin/i686/LimeOS.bin ../bin/i686/iso/boot/LimeOS.bin && grub-mkrescue -o ../bin/i686/LimeOS.iso ../bin/i686/iso

iso: CMakeFiles/iso
iso: CMakeFiles/iso.dir/build.make

.PHONY : iso

# Rule to build all files generated by this target.
CMakeFiles/iso.dir/build: iso

.PHONY : CMakeFiles/iso.dir/build

CMakeFiles/iso.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/iso.dir/cmake_clean.cmake
.PHONY : CMakeFiles/iso.dir/clean

CMakeFiles/iso.dir/depend:
	cd /mnt/d/Documents/Code/LimeOS/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Documents/Code/LimeOS /mnt/d/Documents/Code/LimeOS /mnt/d/Documents/Code/LimeOS/build /mnt/d/Documents/Code/LimeOS/build /mnt/d/Documents/Code/LimeOS/build/CMakeFiles/iso.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/iso.dir/depend
