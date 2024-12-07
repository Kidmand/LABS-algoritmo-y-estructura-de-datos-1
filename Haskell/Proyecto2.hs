--Ejercicios:

--1)a) y 2)a)
data Carrera = Matematica | Fisica | Computacion |  Astronomia deriving (Bounded,Enum,Eq,Show,Ord)

--1)b) Usando pattern matching
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematicas"
titulo Computacion = "Licenciatura en ciencias de la Computacion"
titulo Fisica = "Licenciatura en Fisica"
titulo Astronomia =  "Licenciatura en Astronomia"

--1)b') Una mejor y más linda manera de hacerlo según mi punto de vista.
titulo' :: Carrera -> String
titulo' x = case id x of Matematica -> "Licenciatura en Matematicas"
                         Computacion -> "Licenciatura en ciencias de la Computacion"
                         Fisica -> "Licenciatura en Fisica"
                         Astronomia ->  "Licenciatura en Astronomia"

--3)a)
type Ingreso = Int    
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving (Eq,Show)
data Area = Administrativa | Ensenanza | Economica | Postgrado deriving (Eq,Show)
data Persona = Decane | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso   deriving (Eq,Show)

--3)b)
--El tipo de Docente :: Cargo -> Persona. Ya que el docente, debe tener un cargo.
-- A su vez, El Docente con su cargo pertenecenen a Persona, en otras palabras, 
-- Docente más cualquier cargo, es un constructor de Persona.

--3)c) y d)
cuantos_doce :: [Persona] -> Cargo -> Int
cuantos_doce [] _ = 0
cuantos_doce (x:xs) z | x == Docente z = 1 + cuantos_doce xs z
                      | otherwise = cuantos_doce xs z 


cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc x z = length (filter (Docente z==) x)

--4)a)
primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:_) = Just x

data Cola = VaciaC | Encolada Persona Cola deriving (Show)

--5)a)
atender :: Cola -> Maybe Cola 
atender VaciaC = Nothing
atender (Encolada _ y)  = Just y

--5)b)
encolar :: Persona -> Cola -> Cola
encolar x VaciaC = Encolada x VaciaC
encolar x (Encolada d VaciaC)= Encolada d (Encolada x VaciaC)
encolar x (Encolada z y) = Encolada z (encolar x y)

--5)c)
busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing 
busca (Encolada x z) y | x == (Docente y) = Just (Docente y)
                       | otherwise = busca z y                       

--5)d)
-- Supongo que Cola se parece a un tipo de lista de elementos, pero en este caso más sostificado.

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)

--6)a)
type Guiatelefonica = ListaAsoc String Int

--6)b)
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b y) = case (Nodo a b y) of _ -> 1 + la_long y

--6)c)
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat x Vacia = x
la_concat Vacia x = x
la_concat (Nodo a b y) z = Nodo a b (la_concat y z)

--6)d)
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b y) = (a,b) : la_pares y

--6)e)
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
la_busca (Nodo a b y) x | a == x = Just b
                        |otherwise = la_busca y x

--6)f)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar _ Vacia = Vacia
la_borrar x (Nodo a b y) | a /= x = Nodo a b (la_borrar x y) 
                         | otherwise = la_borrar x y 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Eq,Show)

type Prefijos = Arbol String
can , cana , canario , canas , cant , cantar , canto :: Prefijos 
can = Rama cana "can" cant
cana = Rama canario "a" canas
canario = Rama Hoja "rio" Hoja
canas = Rama Hoja "s" Hoja
cant = Rama cantar "t" canto
cantar = Rama Hoja "ar" Hoja
canto = Rama Hoja "o" Hoja

--7)a)
a_long :: Arbol a -> Int 
a_long Hoja = 0
a_long (Rama y _ z) = case y of _ -> 1 + a_long y + a_long z 

--7)b)
a_hojas :: Arbol a -> Int
a_hojas Hoja = 0 
a_hojas (Rama Hoja _ Hoja) = 1 
a_hojas (Rama y _ z) = a_hojas y + a_hojas z

--Este es un Arbol Int, para cuando hagan los ejemplos tengan uno con 
-- el cual Verificar.
type Numeros = Arbol Int
u1 , d12 , t13 , c120 , c121 , c130 , c131 :: Numeros

u1 = Rama d12 1 t13
d12 = Rama c120 12 c121
c120 = Rama Hoja 120 Hoja
c121 = Rama Hoja 121 Hoja
t13 = Rama c130 13 c131
c130 = Rama Hoja 130 Hoja
c131 = Rama Hoja 131 Hoja

--7)c)
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama x y z) = Rama (a_inc x) (y+1) (a_inc z)

--7)d)
a_map :: (a -> b) -> Arbol a -> Arbol b 
a_map _ Hoja = Hoja
a_map x (Rama z y d) = Rama (a_map x z) (x y) (a_map x d)

a_increprogramada :: Num a => Arbol a -> Arbol a
a_increprogramada = a_map (+1)

sumas :: [Int] -> Int -> Bool
sumas [] _ = False
sumas (x:xs) k | x == k = True
               |otherwise = sumas (xs) (k+x)
sd :: [Int] -> Bool
sd [] = True
sd (x:xs) = sumas xs x      

es_cuadgen :: Int -> Int -> Bool 
--es_cuadgen n 0 = n==0
es_cuadgen 0 s = s==0
es_cuadgen n s |(n+s)==(n*n) = True 
               | otherwise = es_cuadgen (n-1) (s+1)

f []=0
f (x:xs)= xs!!0 + f (tail xs)

j :: Int->[Int]-> Bool
j _ []= False
j k (x:xs)= k==x || j k xs 

h :: [Int]->[Int]->Int
h [] _ = 0
h _ [] = 0 
h (x:xs) ys | j x ys = 1 + h xs ys
            | otherwise = h xs ys 

hgen :: [Int] -> Bool
            
       















                              



