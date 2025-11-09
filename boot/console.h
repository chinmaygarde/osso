#pragma once

#include "efi.h"

inline EFI_STATUS console_print(EFI_SYSTEM_TABLE* efi, char16_t* message) {
  return efi->ConOut->OutputString(efi->ConOut, message);
}
