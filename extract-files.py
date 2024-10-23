#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
namespace_imports = [
    'vendor/samsung/sm8550-common',
]
module = ExtractUtilsModule(
    'gts9wifi',
    'samsung',
    namespace_imports=namespace_imports,
    check_elf=True,
)
if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm8550-common', module.vendor
    )
    utils.run()