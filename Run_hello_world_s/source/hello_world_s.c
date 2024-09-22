/*
 * Copyright 2018 NXP
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#if (__ARM_FEATURE_CMSE & 1) == 0
#error "Need ARMv8-M security extensions"
#elif (__ARM_FEATURE_CMSE & 2) == 0
#error "Compile with --cmse"
#endif

#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "arm_cmse.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"
#include "veneer_table.h"
#include "tzm_config.h"
#include "tzm_api.h"

#include "fsl_power.h"



//for the encryption on edwards
#include "mbedtls/entropy.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/ecdsa.h"
#include "mbedtls/ecp.h"
#include "mbedtls/sha256.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define DEMO_CODE_START_NS 0x00010000
#define NON_SECURE_START DEMO_CODE_START_NS



/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief Application-specific implementation of the SystemInitHook() weak function.
 */


int random_num(void) __attribute__((cmse_nonsecure_entry));


void SystemInitHook(void)
{
    /* The TrustZone should be configured as early as possible after RESET.
     * Therefore it is called from SystemInit() during startup. The SystemInitHook() weak function
     * overloading is used for this purpose.
     */
    BOARD_InitTrustZone();
}

int random_num(void) {
    return rand();
}



/*!
 * @brief Main function
 */
int main(void)
{
    /* Init board hardware. */
    /* set BOD VBAT level to 1.65V */
    POWER_SetBodVbatLevel(kPOWER_BodVbatLevel1650mv, kPOWER_BodHystLevel50mv, false);
    /* attach main clock divide to FLEXCOMM0 (debug console) */
    CLOCK_AttachClk(BOARD_DEBUG_UART_CLK_ATTACH);

    BOARD_InitPins();
    BOARD_BootClockPLL150M();
    BOARD_InitDebugConsole();

    PRINTF("SecureWorld:Generating Random benchmarking test # (unpredictable by nonsecure..)\r\n");
    int randomValue = random_num();
    PRINTF("Random#: : %d\r\n", randomValue);
    PRINTF("Sending test to nonsecure (CPU/GPU cluster)\r\n");

    /* Call non-secure application - jump to normal world */
//    TZM_JumpToNormalWorld(NON_SECURE_START);

    int result = 1;
//    int result = process_test_case_ns(randomValue);
    PRINTF("Test case result from non-secure world (DUMMY/FAKE): %d\r\n", result);


    //sign value with edwards curve
    // Initialize ECDSA context
     mbedtls_ecdsa_context ctx;
     mbedtls_ecdsa_init(&ctx);

     // Generate key pair
     mbedtls_entropy_context entropy;
     mbedtls_ctr_drbg_context ctr_drbg;
     const char *pers = "ecdsa_sign";

     mbedtls_entropy_init(&entropy);
     mbedtls_ctr_drbg_init(&ctr_drbg);

     if (mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy, (const unsigned char *)pers, strlen(pers)) != 0) {
         PRINTF("Failed to seed RNG\r\n");
         return 1;
     }

     if (mbedtls_ecdsa_genkey(&ctx, MBEDTLS_ECP_DP_SECP256R1, mbedtls_ctr_drbg_random, &ctr_drbg) != 0) {
         PRINTF("Failed to generate key pair\r\n");
         return 1;
     }

     unsigned char hash[32];
     mbedtls_sha256_context sha256_ctx;
     mbedtls_sha256_init(&sha256_ctx);
     mbedtls_sha256_starts(&sha256_ctx, 0);
     mbedtls_sha256_update(&sha256_ctx, (unsigned char*)&randomValue, sizeof(randomValue));
     mbedtls_sha256_finish(&sha256_ctx, hash);

     unsigned char signature[MBEDTLS_ECDSA_MAX_LEN];
     size_t signature_len;
     if (mbedtls_ecdsa_write_signature(&ctx, MBEDTLS_MD_SHA256, hash, sizeof(hash), signature, &signature_len, mbedtls_ctr_drbg_random, &ctr_drbg) != 0) {
         PRINTF("Failed to sign\r\n");
         return 1;
     }

     PRINTF("Signature created successfully\r\n");

     mbedtls_ecdsa_free(&ctx);
     mbedtls_entropy_free(&entropy);
     mbedtls_ctr_drbg_free(&ctr_drbg);



    while (1)
    {
        /* This point should never be reached */
    }
}
