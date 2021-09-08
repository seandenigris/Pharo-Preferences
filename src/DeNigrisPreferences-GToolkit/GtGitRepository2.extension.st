Extension { #name : 'GtGitRepository2' }

{ #category : '*DeNigrisPreferences-GToolkit' }
GtGitRepository2 >> gtChangesFor: aView [
	<gtView>
	self workingCopy ifNil: [ ^ aView empty ].
	self workingCopy diffToReferenceCommit treeToShow children
		ifEmpty: [ ^ aView empty ].
	^ aView tree
		title: 'Changes';
		items: [ self workingCopy diffToReferenceCommit treeToShow children ];
		updateWhen: IceRepositoryModified in: Iceberg announcer;
		children: #children;
		expandUpTo: 3;
		priority: 10;
		stencil: [ :anIceNode |
			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				margin: (BlInsets all: 3);
				constraintsDo: [ :c | c vertical fitContent ];
				aptitude:
					(BrGlamorousWithContextMenuAptitude
						content: [ BrGlamorousSimpleContextMenuContent new
								items: {
									'Browse'
										->
											[ :e | anIceNode value canBeBrowsed ifTrue: [ e phlow spawnObject: anIceNode value definition target ] ].
									'Revert changes'
										->
											[ :e | self workingCopy diffToReferenceCommit revertChanges: anIceNode ]};
								yourself ]);
				addChild:
					(anIceNode value icon asElement
						constraintsDo: [ :c | c linear horizontal alignCenter ]);
				addChild:
					(BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						text: anIceNode key asString asRopedText;
						padding:
							(BlInsets
								top: 0
								left: 6
								bottom: 0
								right: 3);
						constraintsDo: [ :c | c linear horizontal alignCenter ]) ];
		actionDropdownButtonLabel: 'Commit'
			tooltip: 'Commit changes'
			content: [ :aDropdown :aTarget | 
			| editor button |
			
			editor := BrEditor new
				hMatchParent;
				vFitContentLimited;
				aptitude: BrGlamorousRegularEditorAptitude;
				text: self currentCommitMessage.
			editor selecter all; select.
			
			button := BrButton new.
			button
				aptitude: BrGlamorousButtonWithIconAptitude;
				icon: BrGlamorousVectorIcons accept;
				label: 'Commit';
				disabled: editor text isEmpty;
				action: [ 
					self recentCommitMessage: editor text asString.
					self executeCommit: editor editor text asString.
					button disable.
					self resetCurrentCommitMessage.
					aDropdown enqueueTask: (BlTaskAction new
						action: [ 
							aDropdown dispatchEvent: (BrDropdownHideWish new anchor: aDropdown).
							aDropdown phlow fireUpdateWish ]) ].

			editor editor
				when: BrTextEditorModifiedEvent
				do: [ :anEvent | button disabled: anEvent text isEmpty ].

			BrVerticalPane new
				hExact: 400;
				vFitContentLimited;
				padding: (BlInsets all: 10);
				addChildren: { editor . button } ]
]
