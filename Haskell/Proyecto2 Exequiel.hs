


--1)a
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Show, Eq, Ord)  

titulo :: Carrera -> String 
titulo x = case x of Matematica -> "Licenciatura en matematica"
                     Fisica -> "Licenciatura en fisica"
                     Computacion -> "Licenciatura en computacion"
                     Astronomia -> "Licenciatura en astronomia" 

--1)b 2)a
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si   deriving (Show, Eq, Ord, Bounded)             

cifradoAmericano :: NotaBasica -> Char 
cifradoAmericano x = case x of Do -> 'C'
                               Re -> 'D'
                               Mi -> 'E'
                               Fa -> 'F'
                               Sol -> 'G'
                               La -> 'A'
                               Si -> 'B'

--3)a

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x 
minimoElemento (x:xs) = min x (minimoElemento xs)


--3)b

minimoElemento' :: (Ord a, Bounded a) => [a] -> a 
minimoElemento' [] = maxBound 
minimoElemento' (x:xs) = min x (minimoElemento' xs)
                         


--3)c) minimoElemento [Fa, La, Sol, Re, Fa] = Re


--4)a)

type Ingreso = Int


-- Cargo y Area son tipos enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving (Show, Eq, Ord)    
data Area = Administrativa | Ensenanza | Economica | Postgrado deriving (Show, Eq, Ord)    

--Persona es un tipo algebraico
data Persona = Decane | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso deriving (Show, Eq, Ord)    

--4)b) 

-- El tipo del constructor Docente :: Cargo -> Persona. Ya que toma un cargo y me devuelve un dato de tipo Persona. 

--4)c) 

cuantos_doc :: [Persona] -> Cargo -> Int 
cuantos_doc [] _ = 0
cuantos_doc x y = length (filter (Docente y==) x) 

--5)a)

data Alteracion = Bemol | Sostenido | Natural   deriving (Show, Eq, Ord) 
data NotaMusical = Nota NotaBasica Alteracion   deriving (Show, Eq, Ord)    

sonido :: NotaBasica -> Int
sonido x = case x of Do -> 1
                     Re -> 3
                     Mi -> 5
                     Fa -> 6
                     Sol -> 8
                     La -> 10
                     Si -> 12

--5)b)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota x y ) = case y of Bemol -> sonido x -1
                                        Sostenido -> sonido x +1
                                        Natural -> sonido x

--6)a)

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x


--7)a)

data Cola = VaciaC | Encolada Persona Cola deriving (Show, Eq, Ord)    


atender :: Cola -> Maybe Cola
atender VaciaC = Nothing 
atender (Encolada y x) = Just x

--7)b)

encolar :: Persona -> Cola -> Cola
encolar x VaciaC = (Encolada x VaciaC)
encolar x (Encolada z y) = (Encolada z (encolar x y))

--7)c) 

busca :: Cola -> Cargo -> Maybe Persona 
busca VaciaC _ = Nothing
busca (Encolada x y ) z = if  Docente z == x then  Just x else busca y z 

--8)a)

data ListaAsoc a b = Vacia| Nodo a b (ListaAsoc a b) deriving (Show, Eq, Ord)  

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String 
type GuiaTelfonica = ListaAsoc String Int 


--8)1)

la_long :: ListaAsoc a b -> Int 
la_long Vacia = 0 
la_long (Nodo _ y z) = case y of _ -> 1 + la_long z   

--8)2)

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia Vacia = Vacia
la_concat Vacia x = x 
la_concat x Vacia = x 
la_concat (Nodo x y z) w = (Nodo x y (la_concat z w))
                                   
--8)3)

la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b 
la_agregar Vacia x y = (Nodo x y Vacia)
la_agregar (Nodo x y q) z w = (Nodo x y (la_agregar q z w )) 

--8)4)

la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo x y z) = (x,y) : la_pares z 

--8)5) 

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia _ = Nothing 
la_busca (Nodo x y z) w = if x==w then Just y else la_busca z w

--8)6)

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar  _ Vacia = Vacia
la_borrar w (Nodo x y z) = if x==w then la_borrar w z else (Nodo x y (la_borrar w z))


data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

--9)a)

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama x y z) = 1 + a_long x + a_long z


--9)b)

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama x y z) = a_hojas x + a_hojas z


--9)c)

a_inc :: Num a => Arbol a -> Arbol a 
a_inc Hoja = Hoja 
a_inc (Rama x y z) = Rama (a_inc x) (y+1) (a_inc z)


--9)d)

a_map :: (a -> b) -> Arbol a -> Arbol b 
a_map _ Hoja = Hoja
a_map f (Rama x y z) = Rama (a_map f x) (f y) (a_map f z)


a_inc_reprogramada :: Num a => Arbol a -> Arbol a
a_inc_reprogramada = a_map (1+) 













