accessing
at: aKey put: aValue
	<primitive: 118>
	
	"if the primitive fails, there is no available space"
	self grow.
	
	^ self at: aKey put: aValue