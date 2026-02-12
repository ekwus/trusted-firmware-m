/*
 * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#ifndef __CONFIG_TFM_TARGET_H__
#define __CONFIG_TFM_TARGET_H__

/* Use stored NV seed to provide entropy */
#undef CRYPTO_NV_SEED
#define CRYPTO_NV_SEED                         0

/* Use external RNG to provide entropy */
#define CRYPTO_EXT_RNG                         1

/* Increase ITS asset slots for Zephyr Settings persistence.
 * Default is 10; we need ~8 UIDs for settings entries array,
 * plus headroom for other ITS consumers (crypto keys, etc.). */
#define ITS_NUM_ASSETS                         20

#endif /* __CONFIG_TFM_TARGET_H__ */
