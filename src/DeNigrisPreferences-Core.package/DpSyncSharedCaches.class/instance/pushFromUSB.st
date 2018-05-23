private
pushFromUSB

	self syncFrom: self usbRepositoryRoot to: self laptopRepositoryRoot.
	self syncFrom: self usbReferenceFolder to: self laptopReferenceFolder.