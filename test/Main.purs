module Test.Main where
import Test.Unit (test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Assert (equal)
import App.Seq as Seq
import Prelude
import Data.Array as A
import Data.Either
import Data.Maybe
import Test.Unit.QuickCheck (quickCheck)

import Test.QuickCheck (Result(), (===))



theCommutativeProperty :: Int -> Int -> Result
theCommutativeProperty a b = (a + b) === (b + a)

main = runTest do
  test "the commutative property" do
    quickCheck theCommutativeProperty
    dengueExampleHead 

dengueExampleHead = (A.head <$> (Seq.readCSV Seq.Comma csv)) `equal` expected
  where 
     expected = Right $ Just { name : "foo", acc : "bar",  year : 1989
               , month : (Just 8), day : (Just 1), host : Just "Moss"
               , segment : (Just "n/a"), sequence : "ATCG", checked : true }
     csv = "genotype,segment,name,acc,year,month,day,country,host,serotype,sequence\n" ++ 
           ",,foo,bar,1989,8,1,USA,Moss,n/a,ATCG\n" ++ 
           ",,11/1666,KR922405,2011,,,Thailand,Human,DENV4,ATGAACCAACGAAAGAAGGTGG\n" ++ 
           ",,Br246RR/10,JN983813,2010,9,8,Brazil,Human,DENV4,ATGAACCAACGAAAAAAGGT\n" ++ 
           ",,D4/Pakistan/150/2009,KF041260,2009,,,Pakistan,Human,DENV4,ATGAACCAACG"