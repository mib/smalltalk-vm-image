accessing
header: anObject
	self selector: (anObject at: #selector).
	self parameters: (anObject at: #parameters)