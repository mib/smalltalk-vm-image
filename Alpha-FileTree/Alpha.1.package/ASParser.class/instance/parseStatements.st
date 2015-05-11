parsing
parseStatements
	| token statements statement |
	
	statements := OrderedCollection new.
	
	token := self peekToken.
	(token type == #closingSquareBracket or: [ token type == #closingBracket ])
		ifTrue: [ ^ statements ].
	
	[
		statement := self parseStatement.
		statement ifNotNil: [
			statements add: statement
		].
		
		self peekToken type == #period
			ifTrue: [ self nextToken. true ]
			ifFalse: [ false ]
	] whileTrue.
	
	^ statements