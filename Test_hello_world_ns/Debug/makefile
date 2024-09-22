################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include utilities/subdir.mk
-include startup/subdir.mk
-include source/subdir.mk
-include drivers/subdir.mk
-include device/subdir.mk
-include component/uart/subdir.mk
-include component/lists/subdir.mk
-include board/subdir.mk
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := Test_hello_world_ns
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: Test_hello_world_ns.axf

# Tool invocations
Test_hello_world_ns.axf: $(OBJS) $(USER_OBJS) makefile $(OPTIONAL_TOOL_DEPS) /Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/Debug/Test_hello_world_s_CMSE_lib.o
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -Xlinker -no-warn-rwx-segments -Xlinker -Map="Test_hello_world_ns.map" -Xlinker --gc-sections -Xlinker -print-memory-usage -Xlinker --sort-section=alignment -Xlinker --cref -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -T Test_hello_world_ns_Debug.ld -o "Test_hello_world_ns.axf" $(OBJS) $(USER_OBJS) $(LIBS) "/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/Debug/Test_hello_world_s_CMSE_lib.o"
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) Test_hello_world_ns.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "Test_hello_world_ns.axf"; # arm-none-eabi-objcopy -v -O binary "Test_hello_world_ns.axf" "Test_hello_world_ns.bin" ; # checksum -p LPC55S69 -d "Test_hello_world_ns.bin";
	-@echo ' '

.PHONY: all clean dependents main-build post-build

-include ../makefile.targets
