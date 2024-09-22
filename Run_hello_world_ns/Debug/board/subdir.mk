################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../board/board.c \
../board/clock_config.c \
../board/pin_mux.c 

C_DEPS += \
./board/board.d \
./board/clock_config.d \
./board/pin_mux.d 

OBJS += \
./board/board.o \
./board/clock_config.o \
./board/pin_mux.o 


# Each subdirectory must supply rules for building sources it contributes
board/%.o: ../board/%.c board/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/source" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/utilities" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/drivers" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/device" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/startup" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/component/uart" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/component/lists" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/CMSIS" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/board" -I"/Users/shreybirmiwal/Documents/MCUXpressoIDE_11.10.0_3148/workspace/Run_hello_world_ns/trustzone" -O0 -fno-common -g3 -gdwarf-4 -D __SEMIHOST_HARDFAULT_DISABLE -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-board

clean-board:
	-$(RM) ./board/board.d ./board/board.o ./board/clock_config.d ./board/clock_config.o ./board/pin_mux.d ./board/pin_mux.o

.PHONY: clean-board

