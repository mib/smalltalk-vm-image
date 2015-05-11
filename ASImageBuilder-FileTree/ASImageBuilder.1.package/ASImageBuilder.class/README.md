Building an image:

	StandardFileStream fileNamed: 'Smalltalk.image' do: [
		:stream |
		stream truncate.
		ASImageBuilder buildImageTo: stream
	]

Output all entries to a separate "human-readable" file (entries.txt):

	| imageBuilder |
	StandardFileStream fileNamed: 'Smalltalk.image' do: [
		:stream |
		stream truncate.
		imageBuilder := ASImageBuilder buildImageTo: stream
	].
	StandardFileStream fileNamed: 'entries.txt' do: [
		:stream |
		stream truncate.
		(imageBuilder instVarNamed: #entries) do: [
			:entry |
			entry printOn: stream. stream nextPut: Character lf
		]
	]
