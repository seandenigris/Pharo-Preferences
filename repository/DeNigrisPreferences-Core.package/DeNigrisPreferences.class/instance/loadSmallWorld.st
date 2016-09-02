project loading
loadSmallWorld
	| repoFolder |
	repoFolder := self pharoRepositories / 'SmallWorld'.
	repoFolder exists ifFalse: [
		self class basicRun: 'git clone git@github.com:seandenigris/SmallWorld.git', repoFolder fullName surroundedBySingleQuotes ].
	Metacello new
		repository: 'filetree://' , (repoFolder / 'repository') fullName;
		baseline: 'SmallWorld';
		onConflict: [ :ex | ex allow ];
		load