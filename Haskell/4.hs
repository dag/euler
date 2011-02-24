import Data.List

palindromes = filter palindromic
            . map (uncurry (*))
            . concatMap (combine nums) $ nums
  where
    palindromic x     = show x == reverse (show x)
    combine x y       = zip (repeat y) x
    nums              = [100 .. 999]

main = print . maximum $ palindromes
