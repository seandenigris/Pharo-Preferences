Extension { #name : #DeNigrisPreferences }

{ #category : #'*DeNigrisPreferences-GToolkit' }
DeNigrisPreferences >> generateElgatoButtonIcons [
	| names |
	"Big thanks to Aliaksei Syrel for helping with this implementation!"
	names := #(playinspect play browse search left right).
	names
		do: [ :name |
			| icon scaledIcon element | 
			icon := (BrGlamorousVectorIcons perform: name) asElement.
			scaledIcon := icon asScalableElement
				scaleStrategy: (BlScalableFixedStrategy zoom: 2.25);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ].
			element := BlElement new
				background: Color white;
				border: (BlBorder paint: Color gray width: 1);
				geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
				padding:
					(BlInsets
						top: 0
						left: 10
						bottom: 0
						right: 10);
				layout: BlFrameLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				addChild: scaledIcon;
				yourself.
			BlExporter png
				element: element;
				fileName: (FileLocator downloads / name , 'png') fullName;
				export ]
]
