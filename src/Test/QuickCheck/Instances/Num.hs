module Test.QuickCheck.Instances.Num 
       (nonNegative,nonPositive
       ,negative,positive
       ) where

import Test.QuickCheck
import Control.Monad.Extensions
import Control.Applicative

nonNegative :: (Num a, Arbitrary a) => Gen a
nonNegative = abs <$> arbitrary

positive :: (Num a, Arbitrary a) => Gen a
positive = nonZero nonNegative

nonPositive :: (Num a, Arbitrary a) => Gen a
nonPositive = negate <$> nonNegative

negative :: (Num a, Arbitrary a) => Gen a
negative = negate <$> positive

nonZero :: (Num a, Arbitrary a) => Gen a -> Gen a
nonZero = satisfiesM (/= 0)