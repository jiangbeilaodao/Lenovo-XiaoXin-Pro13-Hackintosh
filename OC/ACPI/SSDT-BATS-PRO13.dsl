/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLAgRN0V.aml, Sun Jan 10 18:32:10 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000274 (628)
 *     Revision         0x02
 *     Checksum         0xCF
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BATS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BATS", 0x00000000)
{
    External (_SB_.PCI0.LPCB.H_EC.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.BMIH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMIL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.FMVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FMVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FUSH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FUSL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HIDH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HIDL, FieldUnitObj)

    External (_SB_.PCI0.LPCB.H_EC.B1T0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1T1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1R0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1R1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCC0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCC1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCL0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCL1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCV0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCV1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCW0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCW1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPR0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPR1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BTM0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BTM1, FieldUnitObj)

    Scope (\_SB.PCI0.LPCB.H_EC.BAT1)
    {
        Method (B1B2, 2, NotSerialized)
        {
            Local0 = (Arg1 << 0x08)
            Local0 |= Arg0
            Return (Local0)
        }

        Method (CBIS, 0, Serialized)
        {
            Name (PKG1, Package (0x08)
            {
                0x006F007F, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            If (_OSI ("Darwin"))
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    PKG1 [One] = B1B2 (B1T0, B1T1)
                    PKG1 [0x02] = B1B2 (FUSL, FUSH)
                    PKG1 [0x03] = B1B2 (BMIL, BMIH)
                    PKG1 [0x04] = B1B2 (FMVL, FMVH)
                    PKG1 [0x05] = B1B2 (HIDL, HIDH)
                    PKG1 [0x06] = B1B2 (DAVL, DAVH)
                }

                Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BAT1.CBIS.PKG1 */
            }
        }

        Method (CBSS, 0, Serialized)
        {
            Name (PKG1, Package (0x08)
            {
                // Temperature (0x10), AppleSmartBattery format
                0xFFFFFFFF, 
                // TimeToFull (0x11), minutes (0xFF)
                0xFFFFFFFF, 
                // TimeToEmpty (0x12), minutes (0)
                0xFFFFFFFF, 
                // ChargeLevel (0x13), percentage
                0xFFFFFFFF, 
                // AverageRate (0x14), mA (signed)
                0xFFFFFFFF, 
                // ChargingCurrent (0x15), mA
                0xFFFFFFFF, 
                // ChargingVoltage (0x16), mV
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            // Check your _BST method for similiar condition of EC accessibility
             If (_OSI ("Darwin"))
            {
            If (\_SB.PCI0.LPCB.H_EC.ECAV)
            {
                PKG1 [Zero] = B1B2 (BTM0, BTM1)
                PKG1 [One] = B1B2 (BCL0, BCL1)
                PKG1 [0x02] = B1B2 (BCW0, BCW1)
                PKG1 [0x03] = B1B2 (BPR0, BPR1)
                PKG1 [0x04] = B1B2 (B1R0, B1R1)
                PKG1 [0x05] = B1B2 (BCC0, BCC1)
                PKG1 [0x06] = B1B2 (BCV0, BCV1)
            }

            Return (PKG1)
            }
        }
    }
}

