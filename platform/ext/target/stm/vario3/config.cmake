#-------------------------------------------------------------------------------
# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
# Copyright (c) 2021 STMicroelectronics. All rights reserved.
# Copyright (c) 2024 Raytec. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

################################## Vario3 Platform Identification ######################
# Always define this to identify the vario3 platform in common code
add_compile_definitions(TFM_PLATFORM_STM_VARIO3)

################################## Vario3 UART Configuration ###########################
# By default, Vario3 uses UART4 (PC10=TX, PI9=RX) for console output.
# Set TFM_VARIO3_USE_UART7=ON to use UART7 (PE8=TX, PE7=RX) for v1 prototype boards.
# Set TFM_VARIO3_USE_UART7_PMOD=ON to use UART7 (PF7=TX, PF6=RX) for DK Pmod connector.
set(TFM_VARIO3_USE_UART7            OFF         CACHE BOOL      "Use UART7 (PE8/PE7) for console (v1 prototype boards)")
set(TFM_VARIO3_USE_UART7_PMOD       OFF         CACHE BOOL      "Use UART7 (PF7/PF6) for console (DK board Pmod connector)")

message(STATUS "Vario3 TF-M config: TFM_VARIO3_USE_UART7=${TFM_VARIO3_USE_UART7}, TFM_VARIO3_USE_UART7_PMOD=${TFM_VARIO3_USE_UART7_PMOD}")

if(TFM_VARIO3_USE_UART7_PMOD)
    message(STATUS "Vario3 TF-M: Using UART7 on PF7/PF6 (DK Pmod connector)")
    add_compile_definitions(TFM_VARIO3_USE_UART7_PMOD)
elseif(TFM_VARIO3_USE_UART7)
    message(STATUS "Vario3 TF-M: Using UART7 on PE8/PE7 (v1 prototype)")
    add_compile_definitions(TFM_VARIO3_USE_UART7)
else()
    message(STATUS "Vario3 TF-M: Using default UART4")
endif()

################################## BL2 #################################################
set(MCUBOOT_IMAGE_NUMBER                   2           CACHE STRING    "Whether to combine S and NS into either 1 image, or sign each seperately")
set(BL2_HEADER_SIZE                        0x400       CACHE STRING    "Header size")
set(BL2_TRAILER_SIZE                       0x2000      CACHE STRING    "Trailer size")
set(MCUBOOT_ALIGN_VAL                      16          CACHE STRING    "Align option to build image with imgtool")
set(MCUBOOT_UPGRADE_STRATEGY        "SWAP_USING_SCRATCH"      CACHE STRING    "Upgrade strategy for images")
set(TFM_PARTITION_PLATFORM                 ON          CACHE BOOL      "Enable platform partition")
set(MCUBOOT_DATA_SHARING                   ON          CACHE BOOL      "Enable Data Sharing")
set(MCUBOOT_BOOTSTRAP                      ON          CACHE BOOL      "Allow initial state with images in secondary slots(empty primary slots)")
set(MCUBOOT_ENC_IMAGES                     OFF         CACHE BOOL      "Enable encrypted image upgrade support")
# set(MCUBOOT_ENCRYPT_EC256                  ON          CACHE BOOL      "Use EC256 for encrypted image upgrade support")
################################## Dependencies ########################################
set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON          CACHE BOOL      "Enable Internal Trusted Storage partition")
set(TFM_PARTITION_CRYPTO                   ON          CACHE BOOL      "Enable Crypto partition")
set(CRYPTO_HW_ACCELERATOR                  ON          CACHE BOOL      "Whether to enable the crypto hardware accelerator on supported platforms")
set(MBEDCRYPTO_BUILD_TYPE                  minsizerel  CACHE STRING    "Build type of Mbed Crypto library")
set(PS_CRYPTO_AEAD_ALG                     PSA_ALG_GCM CACHE STRING    "The AEAD algorithm to use for authenticated encryption in Protected Storage")
set(MCUBOOT_FIH_PROFILE                    LOW         CACHE STRING    "Fault injection hardening profile [OFF, LOW, MEDIUM, HIGH]")
################################## LOG LEVEL ###########################################
set(TFM_SPM_LOG_LEVEL             TFM_SPM_LOG_LEVEL_INFO          CACHE STRING    "Set default SPM log level as INFO level")
set(TFM_PARTITION_LOG_LEVEL       TFM_PARTITION_LOG_LEVEL_INFO    CACHE STRING    "Set default Secure Partition log level as INFO level")
# MCUboot logging - use INFO for normal operation, DEBUG for troubleshooting
set(MCUBOOT_LOG_LEVEL             "INFO"                          CACHE STRING    "Level of logging to use for MCUboot [OFF, ERROR, WARNING, INFO, DEBUG]" FORCE)
set(MCUBOOT_HW_ROLLBACK_PROT            ON          CACHE BOOL      "Enable security counter validation against non-volatile HW counters")
################################## Platform-specific configurations ####################################
set(CONFIG_TFM_USE_TRUSTZONE               ON           CACHE BOOL      "Use TrustZone")
set(TFM_PARTITION_PROTECTED_STORAGE        ON           CACHE BOOL      "Disable Protected Storage partition")
set(TFM_PARTITION_INITIAL_ATTESTATION      ON           CACHE BOOL      "Disable Initial Attestation partition")
set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT   ON           CACHE BOOL      "Wheter the platform has firmware update support")
################################## FIRMWARE_UPDATE #############################################################
set(TFM_PARTITION_FIRMWARE_UPDATE          ON           CACHE BOOL      "Enable firmware update partition")
set(TFM_FWU_BOOTLOADER_LIB                 "mcuboot"    CACHE STRING    "Bootloader configure file for Firmware Update partition")
set(TFM_CONFIG_FWU_MAX_WRITE_SIZE          1024         CACHE STRING    "The maximum permitted size for block in psa_fwu_write, in bytes.")
set(TFM_CONFIG_FWU_MAX_MANIFEST_SIZE       0            CACHE STRING    "The maximum permitted size for manifest in psa_fwu_start(), in bytes.")
set(FWU_DEVICE_CONFIG_FILE                 ""           CACHE STRING    "The device configuration file for Firmware Update partition")
set(DMCUBOOT_UPGRADE_STRATEGY              SWAP_USING_MOVE)
set(DEFAULT_MCUBOOT_FLASH_MAP             ON            CACHE BOOL     "Whether to use the default flash map defined by TF-M project")
