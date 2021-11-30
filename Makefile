# Compile C/C++ to C compatible shared library
# 
# (c) Justus Languell

TARGET_EXEC ?= liblibrary.so

BUILD_DIR ?= ./
SRC_DIRS ?= ./src

CPP_V ?= 17

SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.cc -or -name *.c -or -name *.s)

OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP -std=c++$(CPP_V) -fPIC -O3 -Wall -Wextra

LDFLAGS ?= -shared -fPIC -O3 -Wall -Wextra

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

# assembly
$(BUILD_DIR)/%.s.o: %.s
	$(MKDIR_P) $(dir $@)
	$(AS) $(ASFLAGS) -c $< -o $@

# c source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# c++ source
$(BUILD_DIR)/%.cc.o: %.cc
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

# c++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@


.PHONY: clean

clean:
	$(RM) -r *.o
	$(RM) -r *.d
	$(RM) -r $(SRC_DIRS)/*.o
	$(RM) -r $(SRC_DIRS)/*.d

-include $(DEPS)

MKDIR_P ?= mkdir -p