/*
 * Copyright 2016-2024 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/**
 * @file    crypto_test.c
 * @brief   Application entry point.
 */
#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_debug_console.h"
/* TODO: insert other include files here. */


#include "mbedtls/entropy.h" //entropy source
#include "mbedtls/ctr_drbg.h" //random number generation



/* TODO: insert other definitions and declarations here. */

/*
 * @brief   Application entry point.
 */
int main(void) {

    /* Init board hardware. */
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
    /* Init FSL debug console. */
    BOARD_InitDebugConsole();
#endif


    //prepare the entropy initialization
    mbedtls_entropy_context entropy;
    mbedtls_entropy_init( &entropy );

    //initialize random number generator
    mbedtls_ctr_drbg_context ctr_drbg;
    char *personalization = "armTrustZoneExperiment123"; //helps add random initial seeding ?
    mbedtls_ctr_drbg_init( &ctr_drbg );


    PRINTF("Hello World !!!!\r\n");


    // random number generator seeding
    int ret = mbedtls_ctr_drbg_seed( &ctr_drbg , mbedtls_entropy_func, &entropy, (const unsigned char *) personalization, strlen( personalization ) );
    if (ret != 0) {
        PRINTF("eror in seeding the random number generator");
        return -1;
    }
    PRINTF("RNG ready");


    /* Force the counter to be placed into memory. */
    volatile static int i = 0 ;
    /* Enter an infinite loop, just incrementing a counter. */
    while(1) {
        i++ ;
        /* 'Dummy' NOP to allow source level single stepping of
            tight while() loop */
        __asm volatile ("nop");
    }
    return 0 ;
}
