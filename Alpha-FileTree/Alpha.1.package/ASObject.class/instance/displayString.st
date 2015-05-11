printing
displayString
	^ String streamContents: [ :stream | self displayOn: stream ]