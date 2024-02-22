module Dragons.TestMain where

import AITests
import Testing

allTests :: Test
allTests = TestGroup "All Tests"
  [ 
    -- ShushiGo,
    aiTests
  ]

testMain :: IO ()
testMain = runTests allTests
