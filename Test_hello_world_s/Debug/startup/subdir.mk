################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/boot_multicore_slave.c \
../startup/startup_lpc55s69_cm33_core0.c 

C_DEPS += \
./startup/boot_multicore_slave.d \
./startup/startup_lpc55s69_cm33_core0.d 

OBJS += \
./startup/boot_multicore_slave.o \
./startup/startup_lpc55s69_cm33_core0.o 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.c startup/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/source" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/utilities" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/drivers" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/device" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/startup" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/component/uart" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/component/lists" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/CMSIS" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/board" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Test_hello_world_s/trustzone" -O0 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -mcmse -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-startup

clean-startup:
	-$(RM) ./startup/boot_multicore_slave.d ./startup/boot_multicore_slave.o ./startup/startup_lpc55s69_cm33_core0.d ./startup/startup_lpc55s69_cm33_core0.o

.PHONY: clean-startup

