utilities
extractTimestampsFromChunk: source

	| timestampParser |
	self error: 'what about single digit months/days? 2015 is hard-coded'.
	timestampParser := #digit asParser, #digit asParser, $/ asParser, #digit asParser, #digit asParser, '/2015 ' asParser, #digit asParser, #digit asParser, $: asParser, #digit asParser, #digit asParser.
	timestampParser := timestampParser flatten.
	^ (timestampParser island ==> #second) star parse: source