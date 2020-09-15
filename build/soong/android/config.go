package android

// Global config used by Octavi soong additions
var OctaviConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.octavi.hardware",
	},
}
