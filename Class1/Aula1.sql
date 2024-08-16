SELECT
    a.cod_cliente as codigo,
    b.nom_cliente as nome_cliente
FROM
         pf1788.endereco_cliente a
    INNER JOIN pf1788.cliente b ON ( a.cod_cliente = b.cod_cliente );
    

SELECT
    a.cod_cliente as codigo,
    b.nom_cliente as nome_cliente
FROM
         pf1788.endereco_cliente a
    LEFT JOIN pf1788.cliente b ON ( a.cod_cliente = b.cod_cliente );
    

SELECT
    a.cod_cliente as codigo,
    b.nom_cliente as nome_cliente
FROM
         pf1788.endereco_cliente a
    RIGHT JOIN pf1788.cliente b ON ( a.cod_cliente = b.cod_cliente );


//Selecionando dados únicos na tabela 
SELECT DISTINCT B.NOM_CLIENTE
    FROM
         pf1788.endereco_cliente a
    LEFT JOIN pf1788.cliente b 
    ON ( a.cod_cliente = b.cod_cliente )
ORDER BY 1 DESC;


SELECT COUNT(1), B.NOM_CLIENTE
    FROM
         pf1788.endereco_cliente a
    LEFT JOIN pf1788.cliente b 
    ON ( a.cod_cliente = b.cod_cliente )
GROUP BY B.NOM_CLIENTE
ORDER BY 1 DESC;



SELECT COUNT(1), B.NOM_CLIENTE
    FROM
         pf1788.endereco_cliente a
    LEFT JOIN pf1788.cliente b 
    ON ( a.cod_cliente = b.cod_cliente )
GROUP BY B.NOM_CLIENTE
HAVING COUNT(1) >= 3
ORDER BY 1 DESC;


SET SERVEROUTPUT ON;

DECLARE
    v_nome VARCHAR2(30);
    V_IDADE NUMBER := 39;
BEGIN

V_NOME := 'VERGILIO';
        dbms_output.put_line ( v_nome || v_idade );

end;


DECLARE
    v_NUMBER NUMBER := 45;
    V_NUMBER2 NUMBER := 39;
BEGIN
        dbms_output.put_line ( v_number * v_number2);

end;

declare
    V_SALARIO number := 1640;
begin
    dbms_output.put_line ('O novo valor do salario minimo é R$: '|| to_char((v_salario * 1.25), '9990.990'));
end;


declare
    V_Dolar number := 45;
    V_CAMBIO number:= 5.49;
begin
    dbms_output.put_line ( v_dolar * v_cambio);
end;
  
  
declare
    V_Dolar number := 45;
begin
    dbms_output.put_line ( v_dolar * 5.49);
end;  
    
    
    
    
