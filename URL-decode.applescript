use AppleScript version "2.4" -- Yosemite (10.10) or lateruse scripting additionson handle_string(lbText)	set _res to urldecode(lbText)	-- to return the result to launchbar instead of copying it substitute	-- the next line for the line after it (set the clipboard to _res)	-- open location "x-launchbar:select?string="&urldecode(_res)	set the clipboard to _resend handle_stringon run	set the clipboard to urldecode(the clipboard as text)end runon urldecode(theText) -- http://harvey.nu/applescript_url_decode_routine.html	set sDst to ""	set sHex to "0123456789ABCDEF"	set i to 1	repeat while i ≤ length of theText		set c to character i of theText		if c = "+" then			set sDst to sDst & " "		else if c = "%" then			if i > ((length of theText) - 2) then				display dialog ("Invalid URL Encoded string - missing hex char") buttons {"Crap..."} with icon stop				return ""			end if			set iCVal1 to (offset of (character (i + 1) of theText) in sHex) - 1			set iCVal2 to (offset of (character (i + 2) of theText) in sHex) - 1			if iCVal1 = -1 or iCVal2 = -1 then				display dialog ("Invalid URL Encoded string - not 2 hex chars after % sign") buttons {"Crap..."} with icon stop				return ""			end if			set sDst to sDst & (ASCII character (iCVal1 * 16 + iCVal2))			set i to i + 2		else			set sDst to sDst & c		end if		set i to i + 1	end repeat	return sDstend urldecode