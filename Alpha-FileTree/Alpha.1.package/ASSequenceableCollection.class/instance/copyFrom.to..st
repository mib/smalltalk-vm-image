copying
copyFrom: fromIndex to: toIndex
	| size newCollection |
	
	fromIndex > toIndex ifTrue: [
		self error: 'From-index must be lower than to-index.'
	].
	
	size := toIndex - fromIndex + 1.
	newCollection := self class new: size.
	
	fromIndex to: toIndex do: [
		:index |
		newCollection at: index - fromIndex + 1 put: (self at: index)
	].
	
	^ newCollection