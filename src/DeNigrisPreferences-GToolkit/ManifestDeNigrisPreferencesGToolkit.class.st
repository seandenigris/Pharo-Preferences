"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestDeNigrisPreferencesGToolkit,
	#superclass : #PackageManifest,
	#category : 'DeNigrisPreferences-GToolkit-Manifest'
}

{ #category : #'code-critics' }
ManifestDeNigrisPreferencesGToolkit class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DeNigrisPreferences #generateElgatoButtonIcons #false)) #'2020-12-14T15:54:24.80014-05:00') )
]

{ #category : #'code-critics' }
ManifestDeNigrisPreferencesGToolkit class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DeNigrisPreferences #generateElgatoButtonIcons #false)) #'2020-12-14T15:54:37.781229-05:00') )
]
