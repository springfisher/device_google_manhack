#
# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Select the SoC
$(call set_soc, tegra, tegra4)

# Add wifi controlller
$(call add_peripheral, tegra, wifi/sd8xxx)

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13912506368
BOARD_CACHEIMAGE_PARTITION_SIZE := 734003200

TARGET_BOARD_INFO_FILE := device/google/manhack/board-info.txt

PRODUCT_COPY_FILES += \
    device/google/manhack/fstab:root/fstab.manhack \
    device/google/manhack/provision-device:provision-device

vendor_partition_directory := vendor/bsp/tegra/device/manhack/stock_images
# BRILLO_VENDOR_PARTITIONS contains a list of strings in the format of
# parent_directory:file_path. Each vendor partition's full path is
# parent_directory/file_path. The directory structure in file_path will be
# preserved.
BRILLO_VENDOR_PARTITIONS := 

BOARD_SEPOLICY_DIRS += \
    device/google/manhack/sepolicy

TARGET_BOARD_PLATFORM := tegra4

# Enable bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/google/manhack/bluetooth

# Must be defined at the end of the file
$(call add_device_packages)
