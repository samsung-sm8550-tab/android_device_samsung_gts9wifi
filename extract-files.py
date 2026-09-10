#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/samsung/sm8550-common',
    'hardware/qcom-caf/sm8550',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/samsung/sm8550-common',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libsecril-client',
        'vendor.qti.hardware.fm@1.0',
    ): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    # AudioReach leaves the Samsung custom key empty for ordinary VoIP.
    'vendor/etc/audio/sku_kalama/resourcemanager.xml': blob_fixup()
        .regex_replace(
            r'(<name>PAL_STREAM_VOIP_RX</name>\n)([ \t]*)'
            r'<priority>[0-9]+</priority>\n'
            r'((?:[ \t]*<(?:samplerate|bit_width)>[0-9]+'
            r'</(?:samplerate|bit_width)>\n)*)'
            r'([ \t]*<custom-config key="voip_comm">\n'
            r'[ \t]*<priority>([0-9]+)</priority>\n'
            r'[ \t]*<snd_device_name>'
            r'(voip-comm-(?:speaker|handset|headset|usb-headset))'
            r'</snd_device_name>)',
            r'\1\2<priority>\5</priority>\n'
            r'\2<snd_device_name>\6</snd_device_name>\n\3\4',
        ),
    # DMA-BUF cleanup passes file descriptors and ignores ion_close's result.
    # Use libc close; the platform libion implementation is a no-op stub.
    'vendor/lib64/libsfp_teegw.so': blob_fixup()
        .binary_regex_replace(b'ion_close\x00', b'close\x00\x00\x00\x00\x00'),
}

module = ExtractUtilsModule(
    'gts9wifi',
    'samsung',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm8550-common', module.vendor)
    utils.run()