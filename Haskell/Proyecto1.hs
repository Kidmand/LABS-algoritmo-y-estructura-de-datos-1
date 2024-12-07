--Ejercicios 

--1)a) 
esCero :: Int -> Bool
esCero x = x == 0
 
--1)b)
esPositivo :: Int -> Bool 
esPositivo x = x > 0 

--1)c)
esVocal :: Char -> Bool 
esVocal x | [x] == "a" = True
          | [x] == "e" = True
          | [x] == "i" = True
          | [x] == "o" = True
          | [x] == "u" = True
          | otherwise = False 

--2)a)
paratodo :: [Bool] -> Bool 
paratodo [] = True
paratodo (x:xs) = x == True && paratodo xs
 
--2)b)
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
 
--2)c)
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs 

--2)d)
factorial :: Int -> Int 
factorial 0 = 1 
factorial n = n * factorial (n-1)

--2)e)
promedio :: [Int] -> Int 
promedio n = div  (sumatoria n) (length n)

--3)
pertenece :: Int -> [Int] -> Bool  
pertenece e [] = False
pertenece e (x:xs) = (e==x) || (pertenece e xs)

--4)a)
--escero :: Int -> Bool   (escero, sería una función para el caso (a -> Bool))
--escero x = x == 0
paratodoc :: [a] -> (a -> Bool) -> Bool
paratodoc [] _ = True
paratodoc (x:xs) d = d x && paratodoc xs d
                      
--4)b)
existe :: [a] -> (a -> Bool) -> Bool 
existe [] _ = False
existe (x:xs) k = k x || existe xs k
                     
--4)c)
--primerelem :: a -> Int      (primerElem, sería una función para el caso (a -> Int),
--primerelem x = 1            vendría ser otra manera de contar los elemntos de una lista)
sumatorias ::  [a] -> (a -> Int) -> Int 
sumatorias [] _ = 0 
sumatorias (x:xs) z = z x + sumatorias xs z

--4)d)
productorias ::  [a] -> (a -> Int) -> Int 
productorias [] _ = 1 
productorias (x:xs) q = q x * productorias xs q

--5)
paratodoss :: [Bool] -> Bool
paratodoss x = paratodoc x id

--6)a)
todosPares :: [Int] -> Bool
todosPares x = paratodoc x even

--6)b)
multiplo :: Int -> Int -> Bool
multiplo x y  = mod y x == 0 
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n x = existe (map (multiplo n) x) (==True)

--6)c)
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatorias [1..(x-1)] (^2)

--6)d)
factoriall :: Int -> Int
factoriall x = productorias [1..x] id 

--6)e)
multiplicaPares :: [Int] -> Int
multiplicaPares x = productorias (filter even x) id

--7)a)
--map :: (a -> b) -> [a] -> [b] Es decir, la función map toma como argumento una función que va de a -> b, una [a]
-- y nos devuelve una [b], que es la lista de aplicar la función a cada elemento de la [a] 
 
-- filter :: (a -> Bool) -> [a] -> [a] Es decir, la función filter toma como argumento una función que va de a -> Bool, una [a]
-- y nos devuelve una [a] cuyos elementos son los que cumplieron con la función a -> Bool, es decir, los que dieron True. 

--7)b) En este caso, como la función succ toma un entero y le suma uno. Entonces , por lo dicho anteriormente, 
--map succ  [1, -4, 6, 2, -8] = [1,-3,7,3,-7] 

--7)c) En este caso, como la función esPositivo me dice si un número es positivo. Entonces, por lo dicho anteriormente,
--  la función filter, nos dará la lista de los elemntos positivos de la lista.
--  filter esPositivo [1,-4,6,2,-8] = [1,6,2] 

--8)a)
duplicar1 ::  [Int] -> [Int] 
duplicar1 [] = []
duplicar1 (x:xs) = (2*x) : duplicar1 xs

-- 8)b)
duplicar :: [Int] -> [Int]
duplicar = map (2*)

--9)a)
listaPares :: [Int] -> [Int]
listaPares [] = []
listaPares (x:xs) | even x = x : listaPares xs
                  | otherwise = listaPares xs

--9)b)
listaParess :: [Int] -> [Int]     
listaParess  = filter even   

--9)c)Ya se me había ocurrido hacerla con filter, así que no se me ocurre de otra manera. 
-- De hecho, este ejercicio plnatea mejorarla justamente teniendo en cuenta la función filter.

--10)a)
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA _ [] = [] 
primIgualesA n (x:xs) | n == x = x : primIgualesA n xs 
                      | otherwise = []

--10)b)
primIgualesA1 ::(Eq a) => a -> [a] -> [a]
primIgualesA1 n x = takeWhile (n==) x

--11)a)
primIguales1 :: (Eq a) => [a] -> [a]
primIguales1 [xss] = [xss]
primIguales1 (x:xs:xss) | x == xs = x : primIguales1 (xs:xss)
                        | x /= xs = [x]

--11)b)
primIguales :: (Eq a) => [a] -> [a]  
primIguales x =  primIgualesA1 (head x) x            

--primIguales :: (Eq a) => [a] -> [a]
--primIguales x = takeWhile ((head x)==) x)





