*DeNigrisPreferences-Platform
forceRefreshMetaclassDefinedSelectors
        | dict |

        dict := Dictionary new.
        self definedClasses do: [ :e || set |
                set := Set new.
                e class protocols
                        select: [  :p  | (p beginsWith: '*') not ]
                        thenDo: [ :p | (e class methodsInProtocol: p) do: [ :m | set add: m selector ] ].
                dict at: e name put:set ].
        metaclassDefinedSelectors := dict