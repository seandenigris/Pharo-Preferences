actions
refreshPackageNamed: aString

	| package |
	package := RPackageOrganizer default packageNamed: aString.
	package
		forceRefreshClassDefinedSelectors;
		forceRefreshMetaclassDefinedSelectors.