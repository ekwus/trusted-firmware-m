/**
  ******************************************************************************
  * @file    board.h
  * @author  Raytec (based on STMicroelectronics MCD Application Team)
  * @brief   board header file for Raytec Vario3 LED Spotlight
  ******************************************************************************
  * @attention
  *
  * Original copyright (c) 2020 STMicroelectronics.
  * Modifications copyright (c) 2024 Raytec.
  * All rights reserved.
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
#ifndef __BOARD_H__
#define __BOARD_H__

/*
 * Console UART Configuration for Vario3
 *
 * Default: UART4 on PC10 (TX) / PI9 (RX) - Vario3 v2 production boards
 * Optional: UART7 on PE8 (TX) / PE7 (RX) - Vario3 v1 prototype boards
 * Optional: UART7 on PF7 (TX) / PF6 (RX) - DK board Pmod connector
 *
 * Build options:
 *   -DTFM_VARIO3_USE_UART7=ON       (v1 prototype: PE8/PE7)
 *   -DTFM_VARIO3_USE_UART7_PMOD=ON  (DK Pmod connector: PF7/PF6)
 */

#if defined(TFM_VARIO3_USE_UART7_PMOD)
/*
 * UART7 Configuration - DK board Pmod connector (PF7/PF6)
 * For testing Vario3 firmware on STM32H573I-DK with console on Pmod CN6.
 * TX: PF7 (AF7)
 * RX: PF6 (AF7)
 */
#define COM_INSTANCE                           UART7
#define COM_CLK_ENABLE()                       __HAL_RCC_UART7_CLK_ENABLE()
#define COM_CLK_DISABLE()                      __HAL_RCC_UART7_CLK_DISABLE()
#define COM_TX_GPIO_PORT                       GPIOF
#define COM_TX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOF_CLK_ENABLE()
#define COM_TX_PIN                             GPIO_PIN_7
#define COM_TX_AF                              GPIO_AF7_UART7

#define COM_RX_GPIO_PORT                       GPIOF
#define COM_RX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOF_CLK_ENABLE()
#define COM_RX_PIN                             GPIO_PIN_6
#define COM_RX_AF                              GPIO_AF7_UART7

#elif defined(TFM_VARIO3_USE_UART7)
/*
 * UART7 Configuration - Vario3 v1 prototype boards
 * TX: PE8 (AF7)
 * RX: PE7 (AF7)
 */
#define COM_INSTANCE                           UART7
#define COM_CLK_ENABLE()                       __HAL_RCC_UART7_CLK_ENABLE()
#define COM_CLK_DISABLE()                      __HAL_RCC_UART7_CLK_DISABLE()
#define COM_TX_GPIO_PORT                       GPIOE
#define COM_TX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOE_CLK_ENABLE()
#define COM_TX_PIN                             GPIO_PIN_8
#define COM_TX_AF                              GPIO_AF7_UART7

#define COM_RX_GPIO_PORT                       GPIOE
#define COM_RX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOE_CLK_ENABLE()
#define COM_RX_PIN                             GPIO_PIN_7
#define COM_RX_AF                              GPIO_AF7_UART7

#else
/*
 * UART4 Configuration - Vario3 v2 production boards (DEFAULT)
 * TX: PC10 (AF8)
 * RX: PI9 (AF8)
 */
#define COM_INSTANCE                           UART4
#define COM_CLK_ENABLE()                       __HAL_RCC_UART4_CLK_ENABLE()
#define COM_CLK_DISABLE()                      __HAL_RCC_UART4_CLK_DISABLE()
#define COM_TX_GPIO_PORT                       GPIOC
#define COM_TX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOC_CLK_ENABLE()
#define COM_TX_PIN                             GPIO_PIN_10
#define COM_TX_AF                              GPIO_AF8_UART4

#define COM_RX_GPIO_PORT                       GPIOI
#define COM_RX_GPIO_CLK_ENABLE()               __HAL_RCC_GPIOI_CLK_ENABLE()
#define COM_RX_PIN                             GPIO_PIN_9
#define COM_RX_AF                              GPIO_AF8_UART4

#endif /* TFM_VARIO3_USE_UART7_PMOD / TFM_VARIO3_USE_UART7 */

/* config for flash driver */
#define FLASH0_SECTOR_SIZE	0x2000
#define FLASH0_PAGE_SIZE 0x2000
#define FLASH0_PROG_UNIT 0x10
#define FLASH0_ERASED_VAL 0xff

#endif /* __BOARD_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
