lcp:: (Eq a) => [a] -> [a] -> [a]
lcp x [] = []
lcp [] y = []
lcp (x:xs) (y:ys) =
   if x == y --head of the list--
      then  x : lcp xs ys -- recursively do the same for the rest of the list --
   else []  -- not the same so no LCP

myLCP :: (Eq t) => [[t]] -> [t]
myLCP = foldl1 lcp