--(1)a)
esCero :: Int -> Bool 
esCero x = x==0

--(1)b)
esPositivo:: Int -> Bool
esPositivo x = x>0

--(1)c)
esVocal :: Char -> Bool
esVocal 'a' = True 
esVocal 'e' = True  
esVocal 'i' = True 
esVocal 'o' = True  
esVocal 'u' = True 
esVocal _ = False 

--(2)a)
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs   

--(2)b)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs   

--(2)c)
productoria:: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs   

--(2)d)
factorial :: Int -> Int 
factorial 0 = 1
factorial x = x * factorial (x-1)

--(2)e)
promedio :: [Int] -> Int 
promedio x = div (sumatoria x) (length x) 

--(3)
pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False 
pertenece n (x:xs) = n==x || pertenece n xs

--(4)a)
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] y = True 
paratodo' (x:xs) y = y x && paratodo' xs y 

--(4)b)
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False 
existe' (x:xs) y = y x || existe' xs y 

--(4)c)
sumatoria' :: [a] -> (a -> Int) -> Int 
sumatoria' [] _ = 0
sumatoria' (x:xs) y = y x + sumatoria' xs y 

--(4)d)
productoria' :: [a] -> (a -> Int) -> Int 
productoria' [] _ = 1
productoria' (x:xs) y = y x * productoria' xs y 

--(5)
paratodo_redefinida :: [Bool] -> Bool
paratodo_redefinida x = paratodo' x id

--(6)a)
todosPares :: [Int] -> Bool
todosPares [] = True
todosPares x = paratodo' (map even x)  (==True)

--(6)b)
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo _ [] = False
hayMultiplo y x = existe' (map (`mod` y) x) (==0)

--(6)c)
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..n] (^2)

--(6)d)
factorial' :: Int -> Int
factorial' x = productoria' [1..x] id

--(6)e)
multiplicaPares :: [Int] -> Int 
multiplicaPares []  = 1
multiplicaPares x = productoria (filter even x)

--(8)a)
doble :: [Int] -> [Int] 
doble [] = []
doble (x:xs) = 2*x : doble xs

--(8)b)
doble' :: [Int] -> [Int]
doble' = map (2*)  

--(9)a)
pares':: [Int] -> [Int]
pares' [] = []
pares' (x:xs) | mod x 2 == 0 = x: pares' xs
              | otherwise = pares' xs

--(9)b)
pares :: [Int] -> [Int] 
pares [] = [] 
pares x = filter even x

--(10)a)              
primIgualesA :: Eq(a) => a -> [a] -> [a]
primIgualesA _ [] = [] 
primIgualesA a (x:xs) | a==x = x : primIgualesA a xs
                      | otherwise = []


--(10)b)
primIgualesA' :: Eq(a) => a -> [a] -> [a] 
primIgualesA' a x = takeWhile (==a) x 


--(11)a)
primIguales'' :: Eq(a) => [a] -> [a] 
primIguales'' [] = []
primIguales'' (x:xs) | x==(head xs) =  x : primIguales'' xs 
                     | otherwise = [x]


--(11)b)
primIguales''' :: Eq(a) => [a] -> [a] 
primIguales''' [] = []
primIguales''' x = primIgualesA' (head x) x             

--(12)
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ y [] _ = y  
cuantGen x y (z:zs) d = (d z) `x` (cuantGen x y (zs) d)  

paratodo'' x f = cuantGen (&&) True x f 

existe'' x f = cuantGen (||) False x f 

sumatoria'' x f = cuantGen (+) 0 x f 

productoria'' x f = cuantGen (*) 1 x f 



multiplo2 :: Int -> Int -> Bool
multiplo2 y x = (mod x y) == 0

suma_multiplo :: [Int] -> Int -> Int
suma_multiplo [] _ = 0
suma_multiplo (x:xs) y = sumatoria (filter (multiplo2 y) (x:xs)) 

data Carrera = Matematica | Astronomia | Fisica | Computacion 

type Nombre = String 

type Legajo = Int 

data Estudiante = Est Legajo Nombre Carrera 

buscar2 :: [Estudiante] -> Carrera -> [Nombre]
buscar2 [] _ = []
buscar2 ((Est x y Matematica):xs) Matematica = y : buscar2 xs Matematica
buscar2 ((Est x y Astronomia):xs) Astronomia = y : buscar2 xs Astronomia
buscar2 ((Est x y Computacion):xs) Computacion = y : buscar2 xs Computacion
buscar2 ((Est x y Fisica):xs) Fisica = y : buscar2 xs Fisica
buscar2 (x:xs) y = buscar2 xs y 

data ListaAsoc a b = Vacia| Nodo a b (ListaAsoc a b) deriving (Show, Eq, Ord)  

la_existe :: (Eq a) => ListaAsoc a b -> a -> Bool 
la_existe Vacia _ = False 
la_existe (Nodo x y z) k = k==x || la_existe z k 


data Color = Rojo | Negro | Azul deriving (Show)

mismo_color :: Color -> Color -> Bool 
mismo_color Rojo Rojo = True 
mismo_color Negro Negro = True 
mismo_color Azul Azul = True 
mismo_color _ _ = False 

data Tipo = Auto | Moto | Camion deriving (Show)

data Vehiculo = Cons Tipo Color deriving (Show)

pintar_auto :: Vehiculo -> Color -> Maybe Vehiculo 
pintar_auto (Cons Auto y) z = Just (Cons Auto z)
pintar_auto _ _ = Nothing

solo_de_color :: Color -> [Vehiculo] -> [Tipo]
solo_de_color _ [] = []
solo_de_color Azul ((Cons x Azul):xs) = x : solo_de_color Azul xs 
solo_de_color Negro ((Cons x Negro):xs) = x : solo_de_color Negro xs 
solo_de_color Rojo ((Cons x Rojo):xs) = x : solo_de_color Rojo xs 
solo_de_color y (x:xs) = solo_de_color y xs


type Precio = Int 

data Producto = Item Nombre Precio 

data Compra = AgregaProd Producto Int Compra | Nada 

costo :: Compra -> Precio 
costo Nada = 0
costo (AgregaProd (Item x y) z k) = z*y + costo k 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

arbol_busca :: Arbol (Int, String) -> Int -> Maybe String 
arbol_busca Hoja k = Nothing
arbol_busca (Rama x (a,b) z) k | k==a = Just b 
                               | arbol_busca x k /= Nothing = arbol_busca x k
                               | otherwise = arbol_busca z k 

data Numeracion = Uno | Dos | Tres | Cuatro deriving (Show)

data Domino = Ficha Numeracion Numeracion 

encajar :: Domino -> Domino -> Maybe Numeracion 
encajar (Ficha Uno _) (Ficha x Uno) = Just x
encajar (Ficha Dos _) (Ficha x Dos) = Just x
encajar (Ficha Tres _) (Ficha x Tres) = Just x
encajar (Ficha Cuatro _) (Ficha x Cuatro) = Just x
encajar _ _ = Nothing



compatibles :: [Domino] -> Numeracion -> [Numeracion]
compatibles [] _ = []
compatibles ((Ficha x Uno):xs) Uno = x : compatibles xs Uno
compatibles ((Ficha x Dos):xs) Dos = x : compatibles xs Dos
compatibles ((Ficha x Tres):xs) Tres = x : compatibles xs Tres
compatibles ((Ficha x Cuatro):xs) Cuatro = x : compatibles xs Cuatro
compatibles (x:xs) y = compatibles xs y 

type Evento = String

data Categoria = Cumple | Reunion | Otro 

data Calendario = Agendar Evento Categoria Calendario | SinEventos 

listar_reuniones :: Calendario -> [Evento]
listar_reuniones SinEventos = []
listar_reuniones (Agendar x Reunion z) = x : listar_reuniones z 
listar_reuniones (Agendar _ _ z) = listar_reuniones z  


a_mi :: (Num a, Ord a) => Arbol a -> [a]
a_mi (Rama Hoja y Hoja) = [y]
a_mi (Rama x y z) = (y : a_mi x) ++ a_mi z

a_min :: (Num a, Ord a) => Arbol a -> a
a_min (Rama Hoja y Hoja) = y
a_min (Rama (Rama a b c) k (Rama x y z)) = a_min (Rama a (min b k) c) `min` a_min (Rama x (min y k) z)

                                         
                                         
arbol_sum :: Arbol Int -> Arbol Int -> Arbol Int
arbol_sum Hoja x = x 
arbol_sum x Hoja = x
arbol_sum (Rama x y z) (Rama Hoja k b) = (Rama x (y+k) (arbol_sum z b ))
arbol_sum (Rama x y z) (Rama a k Hoja) = (Rama (arbol_sum x a ) (y+k) z)
arbol_sum (Rama Hoja y z) (Rama a b c) = (Rama a (y+b) (arbol_sum z c ))
arbol_sum (Rama x y Hoja) (Rama a b c) = (Rama (arbol_sum x a ) (y+b) c)
arbol_sum (Rama x y z) (Rama a b c) = (Rama (arbol_sum x a) (b+y) (arbol_sum z c))
