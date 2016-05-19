module Definitions where

data Term = Constant String | Var Char | Or Term Term | And Term Term | Imp Term Term | DoubleImp Term Term | DoubleNotImp Term Term | Not Term deriving (Eq)

data Equation = Equation Term Term deriving (Eq)

data Sust = Sust1 Term Term | Sust2 Term Term Term Term | Sust3 Term Term Term Term Term Term

(\/) :: Term -> Term -> Term
(\/) t1 t2 = Or t1 t2

(/\) :: Term -> Term -> Term
(/\) t1 t2 = And t1 t2

(==>) :: Term -> Term -> Term
(==>) t1 t2 = Imp t1 t2

(<==>) :: Term -> Term -> Term
(<==>) t1 t2 = DoubleImp t1 t2

(!<==>) :: Term -> Term -> Term
(!<==>) t1 t2 = DoubleNotImp t1 t2

neg :: Term -> Term
neg t1 = Not t1

(===) :: Term -> Term -> Equation
(===) t1 t2 = Equation t1 t2

(=:) :: Term -> Term -> Sust
(=:) t1 (Var i) = Sust1 (Var i) t1
(=:) _ _ = error "Error: substitute variable for expression"

with :: ()
with = ()

using :: ()
using = ()

lambda :: ()
lambda = ()

-- Precedence

infixl 8 \/
infixl 8 /\
infixr 7 ==>
infixl 6 <==>
infixl 6 !<==> 
infixl 5 ===
infixl 5 =: 