processing
buildSystemDictionary
	| systemDictionaryTemporaryOp systemDictionaryOp systemDictionary |
	
	systemDictionaryTemporaryOp := self createDictionaryWith: classes.
	
	systemDictionaryOp := self opFor: Smalltalk class.
	systemDictionary := entries detect: [ :entry | (entry at: 2) = systemDictionaryTemporaryOp ].
	
	systemDictionary at: 2 put: systemDictionaryOp.
	systemDictionary at: 4 put: (self opFor: ASSystemDictionary)