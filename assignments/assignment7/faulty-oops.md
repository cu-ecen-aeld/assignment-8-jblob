# Faulty Driver Kernel Oops Analysis

## Observed Behavior

When writing to /dev/faulty, the system crashes and produces a kernel Oops.

# echo "Hello Juergen" >/dev/faulty
BUG: kernel NULL pointer dereference, address: 00000000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
*pde = 00000000
Oops: 0002 [#1] PREEMPT SMP
CPU: 0 PID: 105 Comm: sh Tainted: G           O       6.1.44 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
EIP: faulty_write+0x2/0x10 [faulty]
Code: Unable to access opcode bytes at 0xc9800fd8.
EAX: 00000000 EBX: c13efb40 ECX: 0000000e EDX: 00532eb0
ESI: c183bf64 EDI: c9801000 EBP: c183bf54 ESP: c183beec
DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000246
CR0: 80050033 CR2: c9800fd8 CR3: 01847000 CR4: 00000690
Call Trace:
 ? show_regs.part.0+0x17/0x1a
 ? __die+0x48/0x80
 ? page_fault_oops+0x56/0x100
 ? kernelmode_fixup_or_oops.constprop.0+0x88/0xe0
 ? __bad_area_nosemaphore.constprop.0+0x11d/0x150
 ? find_vma+0x22/0x40
 ? bad_area_nosemaphore+0x12/0x20
 ? exc_page_fault+0xcb/0x440
 ? do_filp_open+0xa3/0x160
 ? paravirt_BUG+0x10/0x10
 ? handle_exception+0x133/0x133
 ? 0xc9801000
 ? paravirt_BUG+0x10/0x10
 ? faulty_write+0x2/0x10 [faulty]
 ? paravirt_BUG+0x10/0x10
 ? faulty_write+0x2/0x10 [faulty]
 ? vfs_write+0xbc/0x400
 ? next_uptodate_page+0x250/0x250
 ? mt_find+0xd1/0x1b0
 ksys_write+0x6c/0xf0
 __ia32_sys_write+0x10/0x20
 __do_fast_syscall_32+0x50/0xc0
 do_fast_syscall_32+0x32/0x70
 do_SYSENTER_32+0x15/0x20
 entry_SYSENTER_32+0x98/0xf1
EIP: 0xb7efa549
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 76
EAX: ffffffda EBX: 00000001 ECX: 00532eb0 EDX: 0000000e
ESI: b7ed6e34 EDI: 00532eb0 EBP: 0000000e ESP: bf84eaf0
DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
Modules linked in: hello(O) faulty(O) scull(O)
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
EIP: faulty_write+0x2/0x10 [faulty]
Code: Unable to access opcode bytes at 0xc9800fd8.
EAX: 00000000 EBX: c13efb40 ECX: 0000000e EDX: 00532eb0
ESI: c183bf64 EDI: c9801000 EBP: c183bf54 ESP: c183beec
DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000246
CR0: 80050033 CR2: c9800fd8 CR3: 01847000 CR4: 00000690

Welcome to Buildroot
buildroot login:
