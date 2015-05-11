private
scanForEmptySlot
	1 to: keyArray size do: [
		:index |
		(keyArray at: index) ifNil: [ ^ index ]
	].
	
	^ nil