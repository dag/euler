import Data.List

palindromes = filter palindromic
            . map pairProduct
            . concatMap (combine nums) $ nums
  where
    palindromic x     = show x == reverse (show x)
    pairProduct (x,y) = x * y
    combine x y       = zip (repeat y) x
    nums              = [100 .. 999]

main = print . maximum $ palindromes
