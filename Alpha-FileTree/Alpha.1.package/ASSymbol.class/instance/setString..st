private
setString: aString
	1 to: aString size do: [
		:index |
		super at: index put: (aString at: index)
	]