private
credentialsFor: headingString during: aBlock

	| heading username password |
	heading := '[', headingString, ']'.
	FileStream fileNamed: self reference fullName do: [ :str |
		[ str nextLine = heading ] whileFalse. "will signal an error if heading is not present"
		username := (str nextLine copyAfter: $=) trimBoth allButFirst allButLast: 2.
		password := (str nextLine copyAfter: $=) trimBoth allButFirst allButLast: 2 ].
	aBlock value: username value: password.