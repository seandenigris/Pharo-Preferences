UI
scriptBrowser
	<script>
	| browser utils scripts |
	utils := self methodsInProtocol: 'utilities'.
	scripts := utils select: [ :u | u selector isUnary ].
	browser := browser := GLMTabulator new.
	browser
		column: #one;
		column: #two.
	browser transmit
		to: #one;
		andShow: [ :a | 
			a list
				format: [ :scr | scr selector normalizeCamelCase capitalized ];
				onChangeOfPort: #strongSelection
					act: [ :pres | pres selection valueWithReceiver: DeNigrisPreferences new arguments: #() ] ].
	browser transmit
		from: #one;
		to: #two;
		andShow: [ :a | a pharoMethod display: #sourceCode ].
	"The following two lines could be replaced by #openOn:, but we'll keep them for documentation because #startOn: is what you would use when prototyping in the Moose Editor"
	browser startOn: scripts.
	browser open
