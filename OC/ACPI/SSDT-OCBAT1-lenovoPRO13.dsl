/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLuJcuGs.aml, Sun Jan 10 16:37:12 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000004E4 (1252)
 *     Revision         0x02
 *     Checksum         0x20
 *     OEM ID           "OCLT"
 *     OEM Table ID     "BAT1"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "BAT1", 0x00000000)
{
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.B1DI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1IC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.SMPR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMAD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMCM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCNT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMIH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMIL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FMVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FMVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FUSH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FUSL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HIDH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HIDL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT1.POSW, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.BAT1.XBIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.BAT1.XBST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.VPC0, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.VPC0.XBID, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.VPC0.XMTF, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.VPC0.XSBI, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.VPC0.XHPF, MethodObj)

    Method (B1B2, 2, NotSerialized)
    {
        Local0 = (Arg1 << 0x08)
        Local0 |= Arg0
        Return (Local0)
    }

Method (B1B4, 4, NotSerialized)
{
    Local0 = (Arg2 | (Arg3 << 0x08))
    Local0 = (Arg1 | (Local0 << 0x08))
    Local0 = (Arg0 | (Local0 << 0x08))
    Return (Local0)
}

    Scope (_SB.PCI0.LPCB.H_EC)
    {
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPCB.H_EC.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 >>= 0x03
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP) /* \_SB_.PCI0.LPCB.H_EC.RECB.TEMP */
        }

        OperationRegion (BAM0, EmbeddedControl, Zero, 0xFF)
        Field (BAM0, ByteAcc, Lock, Preserve)
        {
            Offset (0x06), //BARL, 64, //Bar coding number, little confidence
            Offset (0x0E), //BARH, 64, //Bar coding number, little confidence
            Offset (0x62), 
            BTM0,   8, //Battery Temperature
            BTM1,   8, 
            BVT0,   8, //Present Voltage
            BVT1,   8, 
            BCR0,   8, //Present Charge Rate
            BCR1,   8,
            BPR0,8, // Percent / Charge Level
            BPR1,8,
            BRC0,   8, //Remaining Capacity
            BRC1,   8, 
            BFC0,   8, //Last Full Charge
            BFC1,   8, 
            BCC0,8, //Charging Current
            BCC1,8,
            BCV0,8, //Charging Voltage
            BCV1,8, 
            Offset (0x76), 
            BDC0,   8, //Design Capacity
            BDC1,   8, 
            BDV0,   8, //Design Voltage
            BDV1,   8,
            BCW0,8, //Time To Empty
            BCW1,8,
            BCL0,8, //Time To Full
            BCL1,8,
            B1R0,8, //Average Rate
            B1R1,8,
            Offset (0x90),
            BCH0, 8, //Battery Type
            BCH1, 8,
            BCH2, 8,
            BCH3, 8, 
            Offset (0xA0),
            B1T0,8, //Battery 1 Manufacture Date
            B1T1,8,
            B2T0,8,
            B2T1,8,
            BCY0,8, //Cycle Count
            BCY1,8,
            Offset (0xBA),
            BRT0, 8,
            BRT1, 8,
            Offset (0xC0) // BARN, 184, //Serial Number
        }
    }

    Scope (_SB.PCI0.LPCB.H_EC.BAT1)
    {
        Method (_BIF, 0, Serialized)  // _BIF: Battery Information
        {
            If (_OSI ("Darwin"))
            {
                Name (BPK1, Package (0x0D)
                {
                    Zero, // Power Unit
                    0xFFFFFFFF, // Design Capacity
                    0xFFFFFFFF, // Last Full Charge Capacity
                    One, // Battery Technology
                    0xFFFFFFFF, // Design Voltage
                    Zero, // Design Capacity of Warning
                    Zero, // Design Capacity of Low
                    0x0100, // Battery Capacity Granularity 1
                    0x40, // Battery Capacity Granularity 2
                    "BASE-BAT", // Model Number 
                    "123456789", // Serial Number 
                    "LiP", // Battery Type
                    "Simplo" // OEM Information
                })
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = (B1B2 (BFC0, BFC1) * 0x0A)
                    If (Local0)
                    {
                        BPK1 [One] = (B1B2 (BDC0, BDC1) * 0x0A)
                        BPK1 [0x02] = Local0
                        BPK1 [0x04] = B1B2 (BDV0, BDV1)
                        Divide (Local0, 0x0A, Local1, Local2)
                        BPK1 [0x05] = Local2
                        Divide (Local0, 0x32, Local1, Local2)
                        BPK1 [0x06] = Local2
                        If ((RECB (0x80, 0x40) == 0x0000313100504D53))
                        {
                            BPK1 [0x0C] = "Simplo"
                        }

                        If ((RECB (0x80, 0x40) == 0x20534F432D545043))
                        {
                            BPK1 [0x0C] = "Celxpert"
                        }

                        If ((RECB (0x80, 0x40) == 0x74726570786C6543))
                        {
                            BPK1 [0x0C] = "Celxpert"
                        }

                        If ((RECB (0x80, 0x40) == 0x3831303200504D53))
                        {
                            BPK1 [0x0C] = "Simplo"
                        }

                        If ((RECB (0x80, 0x40) == 0x393130320043474C))
                        {
                            BPK1 [0x0C] = "LGC"
                        }

                        If ((RECB (0x80, 0x40) == 0x0061646F776E7553))
                        {
                            BPK1 [0x0C] = "Sunwoda"
                        }
                    }
                }

                Return (BPK1) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIF.BPK1 */
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.H_EC.BAT1.XBIF ())
            }
        }

        Method (_BIX, 0, Serialized)  // _BIX: Battery Information Extended
        {
            If (_OSI ("Darwin"))
            {
                Name (BPK1, Package (0x15)
                {
                    0x01, // Revision
                    Zero, // Power Unit
                    0xFFFFFFFF, // Design Capacity
                    0xFFFFFFFF, // Last Full Charge Capacity
                    One, // Battery Technology
                    0xFFFFFFFF, // Design Voltage
                    Zero, // Design Capacity of Warning
                    Zero, // Design Capacity of Low
                    0x00, // Add Cycle Count field
                    100000, // Measurement Accuracy // 100.000%
                    0xFFFFFFFF, // Max Sampling Time
                    0xFFFFFFFF, // Min Sampling Time
                    0xFFFFFFFF, // Min Averaging Interval
                    0xFFFFFFFF, // Min Averaging Interval
                    0x0100, // Battery Capacity Granularity 1
                    0x40, // Battery Capacity Granularity 2
                    "BASE-BAT", // Model Number 
                    "123456789", // Serial Number 
                    "LiP", // Battery Type
                    "Simplo", // OEM Information
                    Zero // Battery Swapping Capability //Revision 1: Zero Non-swappable, One Cold-swappable, 0x10 Hot-swappable
                })
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = (B1B2 (BFC0, BFC1) * 0x0A)
                    If (Local0)
                    {
                        BPK1 [0x02] = (B1B2 (BDC0, BDC1) * 0x0A)
                        BPK1 [0x03] = Local0
                        BPK1 [0x05] = B1B2 (BDV0, BDV1)
                        Divide (Local0, 0x0A, Local1, Local2)
                        BPK1 [0x06] = Local2
                        Divide (Local0, 0x32, Local1, Local2)
                        BPK1 [0x07] = Local2
                        BPK1 [0x08] = B1B2 (BCY0, BCY1)
                        If ((RECB (0x80, 0x40) == 0x0000313100504D53))
                        {
                            BPK1 [0x13] = "Simplo"
                        }

                        If ((RECB (0x80, 0x40) == 0x20534F432D545043))
                        {
                            BPK1 [0x13] = "Celxpert"
                        }

                        If ((RECB (0x80, 0x40) == 0x74726570786C6543))
                        {
                            BPK1 [0x13] = "Celxpert"
                        }

                        If ((RECB (0x80, 0x40) == 0x3831303200504D53))
                        {
                            BPK1 [0x13] = "Simplo"
                        }

                        If ((RECB (0x80, 0x40) == 0x393130320043474C))
                        {
                            BPK1 [0x13] = "LGC"
                        }

                        If ((RECB (0x80, 0x40) == 0x0061646F776E7553))
                        {
                            BPK1 [0x13] = "Sunwoda"
                        }
                    }
                }

                Return (BPK1) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BIF.BPK1 */
            }
        }

        Method (_BST, 0, Serialized)  // _BST: Battery Status
        {
            If (_OSI ("Darwin"))
            {
                Name (PKG1, Package (0x04)
                {
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF
                })
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = (ECRD (RefOf (B1IC)) << One)
                    Local1 = (ECRD (RefOf (B1DI)) | Local0)
                    PKG1 [Zero] = Local1
                    Local2 = B1B2 (BCR0, BCR1)
                    Local2 = POSW (Local2)
                    Local3 = B1B2 (BVT0, BVT1)
                    Divide (Local3, 0x03E8, Local4, Local3)
                    Local2 *= Local3
                    PKG1 [One] = Local2
                    PKG1 [0x02] = (B1B2 (BRC0, BRC1) * 0x0A)
                    PKG1 [0x03] = B1B2 (BVT0, BVT1)
                }

                Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BAT1._BST.PKG1 */
            }
            Else
            {
                Return (\_SB.PCI0.LPCB.H_EC.BAT1.XBST ())
            }
        }
    }

    Scope (_SB.PCI0.LPCB.H_EC.VPC0)
    {
Method (W16B, 3, NotSerialized)
{
    Arg0 = Arg2
    Arg1 = (Arg2 >> 0x08)
}

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1) {})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }
                                
        Method (GBID, 0, NotSerialized)
                {
            If (_OSI ("Darwin"))
            {
                    Name (BFIF, Package (0x04)
                    {
                        Buffer (0x02)
                        {
                             0x00, 0x00                                       // ..
                        }, 

                        Buffer (0x02)
                        {
                             0xFF, 0xFF                                       // ..
                        }, 

                        Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }, 

                        Buffer (0x08)
                        {
                             0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF   // ........
                        }
                    })
                    DerefOf (BFIF [Zero]) [Zero] = B1B2 (BCY0, BCY1) /* \_SB_.PCI0.LPCB.H_EC.B1CY */
                    DerefOf (BFIF [0x02]) [Zero] = BMIL /* \_SB_.PCI0.LPCB.H_EC.BMIL */
                    DerefOf (BFIF [0x02]) [One] = BMIH /* \_SB_.PCI0.LPCB.H_EC.BMIH */
                    DerefOf (BFIF [0x02]) [0x02] = HIDL /* \_SB_.PCI0.LPCB.H_EC.HIDL */
                    DerefOf (BFIF [0x02]) [0x03] = HIDH /* \_SB_.PCI0.LPCB.H_EC.HIDH */
                    DerefOf (BFIF [0x02]) [0x04] = FMVL /* \_SB_.PCI0.LPCB.H_EC.FMVL */
                    DerefOf (BFIF [0x02]) [0x05] = FMVH /* \_SB_.PCI0.LPCB.H_EC.FMVH */
                    DerefOf (BFIF [0x02]) [0x06] = DAVL /* \_SB_.PCI0.LPCB.H_EC.DAVL */
                    DerefOf (BFIF [0x02]) [0x07] = DAVH /* \_SB_.PCI0.LPCB.H_EC.DAVH */
                    Return (BFIF) /* \_SB_.PCI0.LPCB.H_EC.VPC0.GBID.BFIF */
                }
                Else
                {
                Return (\_SB.PCI0.LPCB.H_EC.VPC0.XBID ())
            }
        }
                    
                Method (SMTF, 1, NotSerialized)
                {
            If (_OSI ("Darwin"))
            {
                    If ((Arg0 == Zero))
                    {
                        Local0 = B1B2 (BRT0, BRT1) /* \_SB_.PCI0.LPCB.H_EC.BCRT */
                        Return (Local0)
                    }
                }
                Else
                {
                Return (\_SB.PCI0.LPCB.H_EC.VPC0.XMTF ())
            }
        }
                Method (GSBI, 1, NotSerialized)
                {
            If (_OSI ("Darwin"))
            {
                    If ((Arg0 == Zero))
                    {
                        Name (RETB, Buffer (0x53){})
                        RETB [Zero] = B1B2  (BDC0, BDC1) /* \_SB_.PCI0.LPCB.H_EC.B1DC */
                        RETB [One] = (B1B2  (BDC0, BDC1) >> 0x08)
                        RETB [0x02] = B1B2  (BFC0, BFC1) /* \_SB_.PCI0.LPCB.H_EC.B1FC */
                        RETB [0x03] = (B1B2  (BFC0, BFC1) >> 0x08)
                        RETB [0x04] = B1B2  (BRC0, BRC1) /* \_SB_.PCI0.LPCB.H_EC.B1RC */
                        RETB [0x05] = (B1B2  (BRC0, BRC1) >> 0x08)
                        RETB [0x06] = B1B2  (BCW0, BCW1) /* \_SB_.PCI0.LPCB.H_EC.BDCW */
                        RETB [0x07] = (B1B2  (BCW0, BCW1) >> 0x08)
                        RETB [0x08] = B1B2  (BCL0, BCL1) /* \_SB_.PCI0.LPCB.H_EC.BDCL */
                        RETB [0x09] = (B1B2  (BCL0, BCL1) >> 0x08)
                        RETB [0x0A] = B1B2 (BVT0, BVT1) /* \_SB_.PCI0.LPCB.H_EC.B1VT */
                        RETB [0x0B] = (B1B2 (BVT0, BVT1) >> 0x08)
                        RETB [0x0C] = B1B2  (BCR0, BCR1) /* \_SB_.PCI0.LPCB.H_EC.B1CR */
                        RETB [0x0D] = (B1B2  (BCR0, BCR1) >> 0x08)
                        RETB [0x0E] = B1B2  (BTM0, BTM1) /* \_SB_.PCI0.LPCB.H_EC.B1TM */
                        RETB [0x0F] = (B1B2  (BTM0, BTM1) >> 0x08)
                        RETB [0x10] = B1B2  (B1T0, B1T1) /* \_SB_.PCI0.LPCB.H_EC.B1DT */
                        RETB [0x11] = (B1B2  (B1T0, B1T1) >> 0x08)
                        RETB [0x12] = B1B2  (B2T0, B2T1) /* \_SB_.PCI0.LPCB.H_EC.B2DT */
                        RETB [0x13] = (B1B2  (B2T0, B2T1) >> 0x08)
                        RETB [0x14] = B1B2  (BDV0, BDV1) /* \_SB_.PCI0.LPCB.H_EC.B1DV */
                        RETB [0x15] = (B1B2  (BDV0, BDV1) >> 0x08)
                        RETB [0x16] = B1B4 (BCH0, BCH1, BCH2, BCH3) /* \_SB_.PCI0.LPCB.H_EC.B1CH */
                        RETB [0x17] = (B1B4 (BCH0, BCH1, BCH2, BCH3) >> 0x08)
                        RETB [0x18] = (B1B4 (BCH0, BCH1, BCH2, BCH3) >> 0x10)
                        RETB [0x19] = (B1B4 (BCH0, BCH1, BCH2, BCH3) >> 0x18)
                        RETB [0x1A] = Zero
                        RETB [0x1B] = Zero
                        RETB [0x1C] = Zero
                        RETB [0x1D] = Zero
                        RETB [0x1E] = Zero
                        RETB [0x1F] = Zero
                        RETB [0x20] = RECB (0x88, 0x40) /* \_SB_.PCI0.LPCB.H_EC.B1DN */
                        RETB [0x21] = (RECB (0x88, 0x40) >> 0x08)
                        RETB [0x22] = (RECB (0x88, 0x40) >> 0x10)
                        RETB [0x23] = (RECB (0x88, 0x40) >> 0x18)
                        RETB [0x24] = (RECB (0x88, 0x40) >> 0x20)
                        RETB [0x25] = (RECB (0x88, 0x40) >> 0x28)
                        RETB [0x26] = (RECB (0x88, 0x40) >> 0x30)
                        RETB [0x27] = (RECB (0x88, 0x40) >> 0x38)
                        RETB [0x28] = RECB (0x80, 0x40) /* \_SB_.PCI0.LPCB.H_EC.B1MA */
                        RETB [0x29] = (RECB (0x80, 0x40) >> 0x08)
                        RETB [0x2A] = (RECB (0x80, 0x40) >> 0x10)
                        RETB [0x2B] = (RECB (0x80, 0x40) >> 0x18)
                        RETB [0x2C] = (RECB (0x80, 0x40) >> 0x20)
                        RETB [0x2D] = (RECB (0x80, 0x40) >> 0x28)
                        RETB [0x2E] = (RECB (0x80, 0x40) >> 0x30)
                        RETB [0x2F] = (RECB (0x80, 0x40) >> 0x38)
                        RETB [0x30] = Zero
                        RETB [0x31] = Zero
                        RETB [0x32] = Zero
                        RETB [0x33] = Zero
                        RETB [0x34] = RECB (0x06, 0x40) /* \_SB_.PCI0.LPCB.H_EC.BARL */
                        RETB [0x35] = (RECB (0x06, 0x40) >> 0x08)
                        RETB [0x36] = (RECB (0x06, 0x40) >> 0x10)
                        RETB [0x37] = (RECB (0x06, 0x40) >> 0x18)
                        RETB [0x38] = (RECB (0x06, 0x40) >> 0x20)
                        RETB [0x39] = (RECB (0x06, 0x40) >> 0x28)
                        RETB [0x3A] = (RECB (0x06, 0x40) >> 0x30)
                        RETB [0x3B] = (RECB (0x06, 0x40) >> 0x38)
                        RETB [0x3C] = RECB (0x0E, 0x40) /* \_SB_.PCI0.LPCB.H_EC.BARH */
                        RETB [0x3D] = (RECB (0x0E, 0x40) >> 0x08)
                        RETB [0x3E] = (RECB (0x0E, 0x40) >> 0x10)
                        RETB [0x3F] = (RECB (0x0E, 0x40) >> 0x18)
                        RETB [0x40] = (RECB (0x0E, 0x40) >> 0x20)
                        RETB [0x41] = (RECB (0x0E, 0x40) >> 0x28)
                        RETB [0x42] = (RECB (0x0E, 0x40) >> 0x30)
                        RETB [0x43] = (RECB (0x0E, 0x40) >> 0x38)
                        RETB [0x44] = Zero
                        RETB [0x45] = Zero
                        RETB [0x46] = Zero
                        RETB [0x47] = Zero
                        RETB [0x48] = Zero
                        RETB [0x49] = Zero
                        RETB [0x4A] = Zero
                        RETB [0x4B] = BMIL /* \_SB_.PCI0.LPCB.H_EC.BMIL */
                        RETB [0x4C] = BMIH /* \_SB_.PCI0.LPCB.H_EC.BMIH */
                        RETB [0x4D] = HIDL /* \_SB_.PCI0.LPCB.H_EC.HIDL */
                        RETB [0x4E] = HIDH /* \_SB_.PCI0.LPCB.H_EC.HIDH */
                        RETB [0x4F] = FMVL /* \_SB_.PCI0.LPCB.H_EC.FMVL */
                        RETB [0x50] = FMVH /* \_SB_.PCI0.LPCB.H_EC.FMVH */
                        RETB [0x51] = DAVL /* \_SB_.PCI0.LPCB.H_EC.DAVL */
                        RETB [0x52] = DAVH /* \_SB_.PCI0.LPCB.H_EC.DAVH */
                        Return (RETB) /* \_SB_.PCI0.LPCB.H_EC.VPC0.GSBI.RETB */
                    }
                }
                Else
                {
                Return (\_SB.PCI0.LPCB.H_EC.VPC0.XSBI ())
            }
        }

                Method (MHPF, 1, NotSerialized)
                {
            If (_OSI ("Darwin"))
            {
                    Name (BFWB, Buffer (0x25){})
                    CreateByteField (BFWB, Zero, FB0)
                    CreateByteField (BFWB, One, FB1)
                    CreateByteField (BFWB, 0x02, FB2)
                    CreateByteField (BFWB, 0x03, FB3)
                    CreateField (BFWB, 0x20, 0x0100, FB4)
                    CreateByteField (BFWB, 0x24, FB5)
                    If ((SizeOf (Arg0) <= 0x25))
                    {
                        If ((SMPR != Zero))
                        {
                            FB1 = SMST /* \_SB_.PCI0.LPCB.H_EC.SMST */
                        }
                        Else
                        {
                            BFWB = Arg0
                            SMAD = FB2 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB2_ */
                            SMCM = FB3 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB3_ */
                            BCNT = FB5 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB5_ */
                            Local0 = FB0 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB0_ */
                            If (((Local0 & One) == Zero))
                            {
                                WECB (0x1C, 0x100, FB4) /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB4_ */
                            }

                            SMPR = FB0 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB0_ */
                            Local0 = 0x03E8
                            While (SMPR)
                            {
                                Sleep (One)
                                Local0--
                            }

                            Local0 = FB0 /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.FB0_ */
                            If (((Local0 & One) != Zero))
                            {
                                FB4 = RECB (0x1c, 0x100) /* \_SB_.PCI0.LPCB.H_EC.SMD0 */
                            }

                            FB1 = SMST /* \_SB_.PCI0.LPCB.H_EC.SMST */
                        }

                        Return (BFWB) /* \_SB_.PCI0.LPCB.H_EC.VPC0.MHPF.BFWB */
                    }
                }

                Else
                {
                Return (\_SB.PCI0.LPCB.H_EC.VPC0.XHPF ())
            }
        }
    }
}