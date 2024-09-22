################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/hello_world_ns.c \
../source/semihost_hardfault.c 

C_DEPS += \
./source/hello_world_ns.d \
./source/semihost_hardfault.d 

OBJS += \
./source/hello_world_ns.o \
./source/semihost_hardfault.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/source" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/utilities" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/drivers" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/device" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/startup" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/component/uart" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/component/lists" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/CMSIS" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/board" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_ns/trustzone" -O0 -fno-common -g3 -gdwarf-4 -D __SEMIHOST_HARDFAULT_DISABLE -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/hello_world_ns.d ./source/hello_world_ns.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o

.PHONY: clean-source

