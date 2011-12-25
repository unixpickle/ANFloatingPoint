ANFloatPoint
============

ANFloatingPoint is a decimal floating-point format similar to IEEE's decimal64 format. It supports a 16 digit significand (1 ten's digit followed by decimal digits), encoded in a 53-bit field, accompanied by a 10-bit exponent field.

Because 53 bits is not enough to accurately store 16 decimal digits, ANFloatingPoint values cannot have exponents beyond 512+256, because values above this indicate that the 54-bit significand field begins with 100 (binary). This method of compression derives from IEEE's decimal64 format.

Sample Code
===========

This project includes an Objective-C class for encoding and decoding ANFloatingPoint values to and from the native floating-point format. Unfortunately, most modern operating systems use binary floating points, which allow for a less broad range of floating point values. This being said, most operating systems cannot fully utilize the extent of ANFloatingPoint values.

Here is an example of how would encode a native `double` value as ANFloatingPoint data, and then decode the data back into a `double` variable:

    double original = 1337.141593;
	ANFloatingPoint * origObj = [[ANFloatingPoint alloc] initWithDouble:original];
	NSData * encoded = [origObj packedData];
	...
	// do something do the data here, e.g. load it to a file, etc.
	...
	ANFloatingPoint * decObj = [[ANFloatingPoint alloc] initWithPacked:encoded];
	double decoded = [decObj doubleValue];
	NSLog(@"Original: %f, Decoded: %f", original, decoded);

License
=======

This source code is under no license or warranty. If you decide to beem this code up to Mars, and as a result aliens come and eat your family, don't blame me when you are first-class alien feces. This concept applies to any and all usage of this library, but especially to use by aliens.
