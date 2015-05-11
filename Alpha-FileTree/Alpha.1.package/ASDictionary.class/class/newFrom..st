instance creation
newFrom: anAssociationCollection
	| dictionary |
	
	dictionary := self new: anAssociationCollection size.
	
	anAssociationCollection do: [ :each | dictionary at: each key put: each value ].
	
	^ dictionary