CREATE TABLE ALUNO(
    RA NUMBER PRIMARY KEY,
    NOME VARCHAR2(50)
);

INSERT INTO ALUNO VALUES (1, 'VERGILIO SANTOS');
INSERT INTO ALUNO VALUES (2, 'MARIA SANTOS');
INSERT INTO ALUNO VALUES (3, 'JOSE SANTOS');
INSERT INTO ALUNO VALUES (4, 'LEONARDO GASPAR');
COMMIT;

SELECT * FROM ALUNO;

SET SERVEROUTPUT ON;

DECLARE 
    numeroAluno number := &DigiteSeuRA;
    nomeAluno varchar2(50);
    
BEGIN 

    SELECT
    ra,
    nome
INTO
    numeroaluno,
    nomealuno
FROM
    aluno
WHERE RA = numeroAluno;

    dbms_output.put_line('O código cadastrado do aluno é: '
                     || numeroaluno
                     || '. Seu nome completo é: '
                     || nomealuno);
END;

DECLARE 
    numeroAluno number := &DigiteSeuRA;
    nomeAluno varchar2(50) := '&InsiraSeuNome';
    
BEGIN 

 INSERT INTO aluno VALUES (
    numeroAluno,
    nomeAluno
);
dbms_output.put_line('O novo código cadastrado do aluno é: '
                     || numeroaluno
                     || '. Seu nome completo é: '
                     || nomealuno);
    COMMIT;
END;



DECLARE
    numeroaluno NUMBER := &digiteraprocurar;
    nomealuno   VARCHAR2(50) := '&InsiraNovoNome';
BEGIN
    UPDATE aluno
    SET
        nome = nomealuno
    WHERE
        ra = numeroaluno;

    COMMIT;
END;



DECLARE
    numeroaluno NUMBER := &digiteraprocurar;
BEGIN
    DELETE FROM aluno
    WHERE
        ra = numeroaluno;

    COMMIT;
END;

--Loop while

DECLARE
    vContador NUMBER(2) := 1;
BEGIN
LOOP
    DBMS_OUTPUT.PUT_LINE(vContador);
    vContador := vContador+1;
    EXIT WHEN vContador > 20;
END LOOP;
END;


DECLARE
    vContador NUMBER(2) := 1;
BEGIN
WHILE vContador <= 20 LOOP
    DBMS_OUTPUT.PUT_LINE(vContador);
    vContador := vContador + 1;
END LOOP;
END;

--LOOP FOR

BEGIN
FOR vContador IN 1..20 LOOP
    DBMS_OUTPUT.PUT_LINE(vContador);
END LOOP;
END;

BEGIN
FOR vContador IN REVERSE 1..20 LOOP
    DBMS_OUTPUT.PUT_LINE(vContador);
END LOOP;
END;

DECLARE
    tabuadanumero NUMBER := &digitetabuada;
BEGIN
    dbms_output.put_line('A tabuada do '
                         || tabuadanumero
                         || ' é :');
    FOR i IN 1..10 LOOP
        dbms_output.put_line(i
                             || ' x '
                             || tabuadanumero
                             || ' = '
                             || tabuadanumero * i);

    END LOOP;

END;


DECLARE
    qntPar NUMBER := 0;
    qntImpar NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        IF mod(i,2) = 0 THEN 
            qntPar := qntPar + 1;
        ELSE
            qntImpar := qntImpar + 1;
        END IF;
      
    END LOOP;
    dbms_output.put_line('Quantidade par: ' || qntPar || ', Quantidade impar: ' || qntImpar);
END;



