#include "console.h"
#include "efi.h"

EFI_STATUS EFIAPI efi_main(IN EFI_HANDLE efi_handle,
                           IN EFI_SYSTEM_TABLE* efi_system_table) {
  console_print(efi_handle, L"Hello World");
}
