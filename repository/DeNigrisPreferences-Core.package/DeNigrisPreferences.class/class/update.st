utilities
update

	self
		ensureLatest: 'MonticelloLogin' from: 'http://smalltalkhub.com/mc/SeanDeNigris/MonticelloLogin/main' branch: '' ifAbsent: true;
		ensureLatest: 'DeNigrisPreferences-Core' branch: '' ifAbsent: false;
		ensureLatestPlatformPackage.