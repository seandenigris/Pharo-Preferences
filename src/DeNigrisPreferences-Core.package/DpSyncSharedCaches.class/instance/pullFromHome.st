private
pullFromHome

	self syncFrom: self laptopRepositoryRoot to: self usbRepositoryRoot.
	self syncFrom: self laptopReferenceFolder to: self usbReferenceFolder