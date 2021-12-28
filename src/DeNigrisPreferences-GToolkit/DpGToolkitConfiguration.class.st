Class {
	#name : #DpGToolkitConfiguration,
	#superclass : #Object,
	#category : #'DeNigrisPreferences-GToolkit'
}

{ #category : #accessing }
DpGToolkitConfiguration class >> apply [
	GtPlaygroundToolRegistryAdaptor unregister.
]
