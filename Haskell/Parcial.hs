data Palo = Treboles | Corazones | Picas | Diamantes deriving (Eq,Ord)

mismo_palo :: Palo -> Palo -> Bool
mismo_palo Treboles Treboles = True
mismo_palo Corazones Corazones = True
mismo_palo Picas Picas = True
mismo_palo Diamantes Diamantes = True
mismo_palo _ _ = False 


type Numero = Int

data Naipe = Numerada Numero Palo | Rey Palo | Reina Palo | Jota Palo| As Palo deriving  (Eq, Ord)



valor_naipe :: Naipe -> Int
valor_naipe (Numerada x y) = x 
valor_naipe (Jota x) = 11
valor_naipe (Reina x) = 12
valor_naipe (Rey x) = 13
valor_naipe (As x) = 14

--2

solo_numeradas :: [Naipe] -> Palo -> [Numero]
solo_numeradas [] _ = []
solo_numeradas ((Numerada x Treboles):xs) Treboles = x : solo_numeradas xs Treboles
solo_numeradas ((Numerada x Corazones):xs) Corazones = x : solo_numeradas xs Corazones
solo_numeradas ((Numerada x Picas):xs) Picas = x : solo_numeradas xs Picas
solo_numeradas ((Numerada x Diamantes):xs) Diamantes = x : solo_numeradas xs Diamantes 
solo_numeradas (x:xs) y = solo_numeradas xs y 

--jo=[(Numerada 2 Treboles), (Rey Corazones), (As Picas)]

--solo_numeradas [(Numerada 2 Treboles), (Rey Corazones), (As Picas)] Treboles = [2]

--3

--data ListaAsoc a b = Vacia| Nodo a b (ListaAsoc a b) deriving (Eq,Ord,Show)

--la_menores :: ListaAsoc a b -> b -> ListaAsoc a b 
--la_menores Vacia _ = Vacia
--la_menores (Nodo x y z) k = if y==k then (Nodo x y (la_menores z k)) else la_menores z k 

