sqrtCeiling = ceiling . sqrt . fromIntegral

primes = 2 : 3 : filter primal [5, 7..]
  where
    primal n = all ((/= 0) . mod n)
             $ takeWhile ((<= n) . (^2))
             $ tail primes

factors n = foldl (++) []
          $ map (\x -> [x,  n `div` x])
          $ filter ((== 0) . mod n) [1..sqrtCeiling n]

main = print
     $ foldl max 0
     $ filter (`elem` primes') factors'
  where
    factors' = factors num
    primes'  = takeWhile (< (sqrtCeiling num)) primes
    num      = 600851475143
