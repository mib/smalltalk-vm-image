enumerating
keysDo: aBlock
	keyArray do: [ :each | each ifNotNil: [ aBlock value: each ] ]