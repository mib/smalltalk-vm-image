private
scanFor: aKey
	1 to: keyArray size do: [
		:index |
		(keyArray at: index) = aKey
			ifTrue: [ ^ index ]
	].
	
	^ nil