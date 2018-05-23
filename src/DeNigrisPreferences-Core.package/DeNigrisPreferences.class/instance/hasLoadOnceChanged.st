private-testing
hasLoadOnceChanged

	^ lastLoadOnce ~= (self class>>#loadOnce) timeStamp.