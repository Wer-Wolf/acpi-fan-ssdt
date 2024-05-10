DefinitionBlock ("", "SSDT", 2, "Wolf  ", "FAN TEST", 0x1)
{
	Scope (\_SB)
	{
		Device (FAN0)
		{
			Name (_HID, EisaID("PNP0C0B"))
			Name (_UID, 0x1234)
			
			Name (CTRL, 0x0)
			
			Name (_FIF, Package () {
				0x0,	// Revision 0
				0x0,	// No fine grain control
				0x0,	// Step size (not applicable)
				0x0	// No notification support
			})
			
			Name (_FPS, Package () {
				0x0,			// Revision 0
				Package () {
					0x0,		// Control 0x0
					0xFFFFFFFF,	// No associated trip point
					0,		// 0 RPM
					0xFFFFFFFF,	// No noise value
					0		// 0 mW
				},
				Package () {
					0x1,		// Control 0x1
					0xFFFFFFFF,	// No associated trip point
					2500,		// 2500 RPM
					0xFFFFFFFF,	// No noise value
					500		// 500 mW
				},
				Package () {
					0x2,		// Control 0x2
					0xFFFFFFFF,	// No associated trip point
					5000,		// 5000 RPM
					0xFFFFFFFF,	// No noise value
					1000		// 1000 mW
				}
			})
			
			Function (_FSL, UnknownObj, IntObj) {	// Fan set level
				CTRL = Arg0
			}
			
			Function (_FST, PkgObj) {		// Fan status
				Return (Package () {
					0x0,	// Revision 0
					CTRL,	// Current control
					500	// Current speed
				})
			}
		}
	}
}
