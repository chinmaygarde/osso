#pragma once

#include "efi.h"

inline EFI_STATUS console_print(EFI_SYSTEM_TABLE* efi,
                                unsigned short* message) {
  return efi->ConOut->OutputString(efi->ConOut, (CHAR16*)message);
}
