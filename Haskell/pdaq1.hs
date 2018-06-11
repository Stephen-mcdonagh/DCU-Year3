trans = [((1,"a",""),(1,"a")), ((1,"b",""),(1,"b")), ((1,"a",""),(2,"")), ((1,"b",""),(2,"")),  ((1,"",""),(2,"")), ((2,"a","a"),(2,"")), ((2,"b","b"),(2,""))]
pal = (1,[2], trans)

conf1 = (1, "aa", "")
conf2 = (1, "aba", "")
conf3 = (1, "a", "")



type PDA = (Integer, [Integer], [Transition])
{-	int 	- start state
	[int] 	- accepting states
	[Trans] - list of transitions -}

type Configuration = (Integer, String, String)
{-	int 	- current state
	String 	- remaining input (x:xs) = xs
	String 	- whole stack -}

type Transition = ((Integer, String, String), (Integer, String))
{-	int 	- current state
	String 	- char of the input (x:xs) = x
	String 	- pop -}
{-	int 	- new state
	String 	- push to the stack -}

data Result = Accept | Reject
    deriving Show


pdaStartSt :: PDA -> Integer
pdaStartSt (state, _, _) = state

pdaAcceptSt :: PDA -> [Integer]
pdaAcceptSt (_, accept, _) = accept

pdaTran :: PDA -> [Transition]
pdaTran (_, _, tran) = tran



confCurrSt :: Configuration -> Integer
confCurrSt (state, _, _) = state

confRemainInput :: Configuration -> String
confRemainInput (_, input, _) = input

confStack :: Configuration -> String
confStack (_, _, stack) = stack

confTopStack :: Configuration -> String
confTopStack (_, _, "") = ""
confTopStack (_, _, (x:xs)) = [x]

confNextChar :: Configuration -> String
confNextChar (_, "", _) = ""
confNextChar (_, (x:xs), _) = [x]




transCurrSt :: Transition -> Integer
transCurrSt ((state, _, _), _) = state

transInputChar :: Transition -> String
transInputChar ((_, input, _), _) = input

transPopChar :: Transition -> String
transPopChar ((_, _, pop), _) = pop

transNewSt :: Transition -> Integer
transNewSt (_, (state, _)) = state

transPushChar :: Transition -> String
transPushChar (, (, push)) = push


getResult :: [Result] -> Result
getResult [] = Reject
getResult [x] = x 
getResult (Accept:_) = Accept
getResult (_:xs) = getResult xs


popFunc :: String -> String
popFunc "" = ""
popFunc (x:xs) = xs


nextConf :: Configuration -> Transition -> Configuration
nextConf (, input, stack) ((, readInput, pop), (nextState, push))
    | readInput == "" && pop == "" = (nextState, input, (push ++ stack))
    | readInput /= "" && pop == "" = (nextState, popFunc input, (push ++ stack))
    | readInput == "" && pop /= "" = (nextState, input, (push ++ (popFunc stack)))
    | otherwise  = (nextState, popFunc input, (push ++ (popFunc stack)))

isValid :: Configuration -> Transition -> Bool
isValid conf tran = x && y && z
    where
    x = transCurrSt tran == confCurrSt conf
    y = if transInputChar tran == "" then True else transInputChar tran == confNextChar conf
    z = if transPopChar tran == "" then True else transPopChar tran == confTopStack conf


filterTrans :: Configuration -> [Transition] -> [Transition]
filterTrans conf trans = filter (isValid conf) trans


solve :: PDA -> Configuration -> Result
solve pda@(startState, acceptStates, trans) conf@(state, input, stack)
    | state elem acceptStates && input == "" && stack == "" = Accept
    | length (filterTrans conf trans) > 0 = getResult (map (solve pda) (map (nextConf conf) (filterTrans conf trans)))
    | otherwise = Reject
    

run :: PDA -> String -> Result
run (startState, acceptStates, trans) input = solve (startState, acceptStates, trans) (startState, input, "")