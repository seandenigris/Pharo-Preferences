Class {
	#name : 'DpGToolkitConfiguration',
	#superclass : 'Object',
	#category : 'DeNigrisPreferences-GToolkit',
	#package : 'DeNigrisPreferences-GToolkit'
}

{ #category : 'accessing' }
DpGToolkitConfiguration class >> apply [
	GtPlaygroundToolRegistryAdaptor unregister.
	BrEditorElement editorTabSize: 4.
	BlSpace userScale: 1.2.
	#GtPharoCoderSettings asClassIfPresent: [ :aCls | aCls isTraitMethodsFilterDefault: true ].
]
