-- Aula 2

-- Ativando a exibi��o de sa�da do DBMS_OUTPUT
SET SERVEROUTPUT ON;

DECLARE
    valorCarro NUMBER := &digiteUmValor;
    valorParcela NUMBER;
    
BEGIN
    valorParcela := valorCarro /10;
    dbms_output.put_line('O valor de cada parcela �: R$' ||(valorParcela * 1.03));
    valorCarro := (valorParcela *1.03);
    dbms_output.put_line('O valor do carro financiado �: R$' ||(valorCarro * 10));
END;

DECLARE
    qntParcela NUMBER := &digiteQntParcelas;
    valorCarro NUMBER := 10000;
    valorInicial NUMBER := (valorCarro * 0.2);
    valorFinal NUMBER := (valorCarro - valorInicial);
BEGIN
    dbms_output.put_line('Valor do Carro R$' || valorCarro);
    dbms_output.put_line('O valor do inicial carro � R$' || (valorInicial));
    dbms_output.put_line('Valor com 6 de parcelas:' || (valorFinal * 1.10));
    dbms_output.put_line('Valor com 12 de parcelas:' || (valorFinal * 1.15));
    dbms_output.put_line('Valor com 18 de parcelas:' || (valorFinal * 1.20));
    dbms_output.put_line('Voc� escolheu ' || (qntParcela) || ' parcelas');
END;


DECLARE
    valorCarro NUMBER := &DigiteUmValor;
    valorEntrada NUMBER;
    qtdParcelas NUMBER;
BEGIN
    valorEntrada := valorCarro * 0.20;
    dbms_output.put_line('Valor do Carro R$' || valorCarro);
    dbms_output.put_line('Valor de Entrada R$' || valorEntrada);
    dbms_output.put_line('Valor do Carro financiado em' || qtdParcelas || 'Vezes' || ((valorCarro-valorEntrada) * 1.10) + valorEntrada);
    dbms_output.put_line('Valor do Carro financiado em' || qtdParcelas || 'Vezes' || ((valorCarro-valorEntrada) * 1.15) + valorEntrada);
    dbms_output.put_line('Valor do Carro financiado em' || qtdParcelas || 'Vezes' || ((valorCarro-valorEntrada) * 1.20) + valorEntrada);
END;


DECLARE
    genero VARCHAR2(30) := '&digiteSeuGenero';

BEGIN
    IF UPPER(genero)  = 'M' THEN
    dbms_output.put_line('O genero digitado � MASCULINO');
    
    ELSIF UPPER(genero) = 'F' THEN
    dbms_output.put_line('O genero digitado � FEMININO');
    
    ELSE
    dbms_output.put_line('Genero n�o identificado');
    
    END IF;
END;


DECLARE
    valorDigitado NUMBER := &DigiteUmValor;
BEGIN
    IF (valorDigitado mod 2) = 0 THEN
    dbms_output.put_line('O valor � PAR');
    
    ELSIF (valorDigitado mod 2) = 1 THEN
    dbms_output.put_line('O valor � �MPAR');
    
    ELSE
    dbms_output.put_line('Valor n�o identificado');
    
    END IF;

END;


SELECT
    COUNT(1),
    CASE
        WHEN dealsize = 'Medium' THEN
            'Empresa de Porte M�dio'
        WHEN dealsize = 'Small' THEN
            'Empresa de Porte Pequeno'
        WHEN dealsize = 'Large' THEN
            'Empresa de Porte Grande'
    END porteempresa
FROM
    tabela_vendas
    GROUP BY
    CASE
        WHEN dealsize = 'Medium' THEN
            'Empresa de Porte M�dio'
        WHEN dealsize = 'Small' THEN
            'Empresa de Porte Pequeno'
        WHEN dealsize = 'Large' THEN
            'Empresa de Porte Grande'
    END 
ORDER BY 1;

    
    
    