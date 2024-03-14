use PROVEEDORES2

--Obtener todos los detalles de todos los artículos de CACERES. --
SELECT * FROM ARTICULOS 
WHERE CIUDAD = 'CACERES'

--Obtener todos los valores de P# para los proveedores que abastecen el artículo T1. --
SELECT P# FROM ENVIOS 
WHERE T# = 'T1'

--Obtener la lista de pares de atributos (COLOR, CIUDAD) de la tabla componentes eliminando los pares duplicados. --
SELECT DISTINCT COLOR, CIUDAD FROM COMPONENTES

--Obtener de la tabla de artículos los valores de T# y CIUDAD donde el nombre de la ciudad acaba en D o contiene al menos una E. --
SELECT T#, CIUDAD FROM ARTICULOS
WHERE CIUDAD LIKE '%D' OR CIUDAD LIKE '%E%'

--Obtener los valores de P# para los proveedores que suministran para el artículo T1 el componente C1.--
SELECT P# FROM ENVIOS 
WHERE C# = 'C1' AND T# = 'T1'

--Obtener	los	valores	de TNOMBRE   en	orden	alfabético para los artículos abastecidos por el proveedor P1 --
SELECT TNOMBRE FROM ENVIOS E JOIN ARTICULOS A  
ON E.T# = A.T# 
WHERE E.P#  = 'P1' 
ORDER BY TNOMBRE

--Obtener los valores de C# para los componentes suministrados para cualquier artículo de MADRID.--
SELECT DISTINCT C#  FROM ENVIOS 
WHERE T# IN (SELECT T# FROM ARTICULOS WHERE CIUDAD = 'MADRID'); 

--Obtener	todos	los	valores de C# de los componentes tales que ningún otro componente tenga un valor de peso inferior. --
SELECT C# FROM COMPONENTES 
WHERE PESO = (SELECT MIN(PESO) FROM COMPONENTES)

--Obtener los valores de P# para los proveedores que suministren los artículos T1 y T2. --
SELECT P# FROM ENVIOS 
WHERE T# = 'T1' 
INTERSECT 
SELECT P# FROM ENVIOS WHERE T# = 'T2'

--Obtener los valores de P# para los proveedores que suministran para un artículo de SEVILLA o MADRID un componente ROJO. --
SELECT E.P# FROM ENVIOS E
JOIN ARTICULOS A ON E.T# = A.T# 
JOIN COMPONENTES C ON E.C# = C.C#
WHERE (A.CIUDAD = 'MADRID' OR A.CIUDAD = 'SEVILLA') AND (C.COLOR = 'ROJO')

--Obtener,	mediante	subconsultas,	los	valores	de C# par los componentes suministrados para algún artículo de SEVILLA por un proveedor de SEVILLA. --
SELECT E.C# FROM ENVIOS E
WHERE E.P# IN (SELECT P# FROM PROVEEDORES WHERE CIUDAD = 'SEVILLA') 
AND (E.T# IN(SELECT T# FROM ARTICULOS WHERE CIUDAD = 'SEVILLA'))

--Obtener los valores de T# para los artículos que usan al menos un componente que se puede obtener con el proveedor P1. --
SELECT DISTINCT E.T# FROM ENVIOS E 
WHERE E.C# IN (SELECT C# FROM ENVIOS WHERE P# = 'P1') 

--Obtener todas las ternas (CIUDAD, C#, CIUDAD) tales que un proveedor de la primera ciudad suministre el componente especiﬁcado para un artículo montado en la segunda ciudad. --
SELECT P.CIUDAD, E.C#, A.CIUDAD FROM ENVIOS E
JOIN PROVEEDORES P ON E.P# = P.P#
JOIN ARTICULOS A ON E.T# = A.T#

--Repetir el ejercicio anterior pero sin recuperar las ternas en los que los dos valores de ciudad sean los mismos. --
SELECT P.CIUDAD, E.C#, A.CIUDAD FROM ENVIOS E
JOIN PROVEEDORES P ON  E.P# = P.P#
JOIN ARTICULOS A ON E.T# = A.T#
WHERE P.CIUDAD != A.CIUDAD

--Obtener el número de suministros, el de artículos distintos suministrados y la cantidad total de artículos suministrados por el proveedor P2. --
SELECT COUNT(*) AS 'Suministros', COUNT(DISTINCT T#) AS 'Articulos', SUM(cantidad) FROM ENVIOS
WHERE P# = 'P2'

--Para cada artículo y componente suministrado obtener los valores de C#, T# y la cantidad total correspondiente. --
SELECT C#, T#, SUM(CANTIDAD) TOTAL FROM ENVIOS GROUP BY C#, T#; 

--Obtener los valores de T# de los artículos abastecidos al menos por un proveedor que no viva en MADRID y que no esté en la misma ciudad en la que se monta el artículo. --
SELECT DISTINCT E.T# FROM ENVIOS E
JOIN ARTICULOS A ON E.T#  = A.T#
JOIN PROVEEDORES P ON E.P# = P.P#
WHERE P.CIUDAD <> 'MADRID' AND P.CIUDAD <> A.CIUDAD

--Obtener los valores de P# para los proveedores que suministran al menos un componente suministrado al menos por un proveedor que suministra al menos un componente ROJO. --
SELECT DISTINCT E.P# FROM ENVIOS E, COMPONENTES C
WHERE E.C# = C.C# AND C.COLOR = 'ROJO'

--Obtener los identiﬁcadores de artículos, T#, para los que se ha suministrado algún componente del que se haya suministrado una media superior a 320 artículos. --
SELECT E.T# FROM ENVIOS E

--Seleccionar los identiﬁcadores de proveedores que hayan realizado algún envío con Cantidad mayor que la media de los envíos realizados para el componente a que corresponda dicho envío. --
SELECT DISTINCT A.P# FROM ENVIOS A 
WHERE A.C# IN(
	SELECT B.C# FROM ENVIOS B
	GROUP BY B.C#
	HAVING A.CANTIDAD > AVG(B.CANTIDAD))

--Seleccionar los identiﬁcadores de componentes suministrados para el artículo 'T2' por el proveedor 'P2'. --
SELECT C# FROM ENVIOS 
WHERE P# = 'P2' AND T# = 'T2'

--Seleccionar todos los datos de los envíos realizados de componentes cuyo color no sea 'ROJO'. --
SELECT * FROM ENVIOS E
WHERE E.C# IN(
	SELECT B.C# FROM COMPONENTES B
	WHERE B.COLOR <> 'ROJO')

--Seleccionar los identiﬁcadores de componentes que se suministren para los artículos 'T1' y 'T2'. --
SELECT DISTINCT A.C# FROM ENVIOS A
WHERE A.C# IN (
    SELECT B.C# FROM ENVIOS B
    WHERE B.T# = 'T1'
) AND A.C# IN (
    SELECT C.C# FROM ENVIOS C
    WHERE C.T# = 'T2'
)

--Seleccionar el identiﬁcador de proveedor y el número de envíos de componentes de color 'ROJO' llevados a cabo por cada proveedor. --
SELECT E.P#, COUNT(*) AS 'Envios' FROM ENVIOS E
WHERE E.C# IN (
    SELECT C.C# FROM COMPONENTES C
    WHERE C.COLOR = 'ROJO'
)
GROUP BY E.P#

--Seleccionar los colores de componentes suministrados por el proveedor 'P1'. --
SELECT DISTINCT C.COLOR FROM ENVIOS E
JOIN COMPONENTES C ON E.C# = C.C#
WHERE E.P# = 'P1'

--Seleccionar los datos de envío y nombre de ciudad de aquellos envíos que cumplan que el artículo, proveedor y componente son de la misma ciudad. --
SELECT E.*, C.CIUDAD FROM ENVIOS E
JOIN COMPONENTES C ON E.C# = C.C#
JOIN ARTICULOS A ON E.T# = A.T#
JOIN PROVEEDORES P ON E.P# = P.P#
WHERE (C.CIUDAD = A.CIUDAD AND A.CIUDAD = P.CIUDAD)

--Seleccionar los nombres de los componentes que son suministrados en una cantidad total superior a 500. --
SELECT DISTINCT C.CNOMBRE FROM COMPONENTES C
WHERE C.C# IN (
    SELECT E.C# FROM ENVIOS E
    GROUP BY E.C#
    HAVING SUM(E.CANTIDAD) > 500
)

--Seleccionar	los	identiﬁcadores	 de	proveedores	que residan en Sevilla	y no suministren más de dos artículos distintos. --
SELECT P# FROM PROVEEDORES 
WHERE CIUDAD = 'SEVILLA'
EXCEPT
SELECT P# FROM ENVIOS 
GROUP BY P#
HAVING COUNT(DISTINCT T#) > 2;

--Seleccionar los identiﬁcadores de artículos para los cuales todos sus componentes se fabrican en una misma ciudad. --
SELECT E.T# FROM ENVIOS E
JOIN COMPONENTES C ON E.C# = C.C#
GROUP BY E.T#
HAVING COUNT(DISTINCT C.CIUDAD) = 1

--Seleccionar los identiﬁcadores de artículos para los que se provean envíos de todos los componentes existentes en la base de datos. --
SELECT E.T# FROM ENVIOS E
GROUP BY E.T#
HAVING COUNT(DISTINCT E.C#) = (SELECT COUNT(C#) FROM COMPONENTES)

-- Seleccionar los códigos de proveedor que suministran al menos dos componentes de color 'ROJO'.
-- preguntar, la resolucion del profe no cierra con la nuestra
SELECT E.P# FROM ENVIOS E
JOIN COMPONENTES C ON E.C# = C.C#
WHERE C.COLOR = 'ROJO'
GROUP BY E.P#
HAVING COUNT(*) > 1