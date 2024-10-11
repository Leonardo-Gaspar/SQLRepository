SET SERVEROUTPUT ON;

--Criando função para calcular fgts
CREATE OR REPLACE FUNCTION cal_fgts (
    p_fgts NUMBER
) RETURN NUMBER IS
    v_valor NUMBER;
    sal_minimo EXCEPTION;
BEGIN
    IF p_fgts <= 1200 THEN
        RAISE sal_minimo;
    ELSE
        v_valor := p_fgts * 1.08;
        RETURN v_valor;
    END IF;
EXCEPTION
    WHEN sal_minimo THEN
        raise_application_error(-20015,'O valor passado deve ser maior que o salário mínimo');
END;

-- Testando a função
SELECT cal_fgts(10000) FROM dual;

DECLARE
    fgts NUMBER;
BEGIN
    fgts := cal_fgts(1000);  
    dbms_output.put_line(fgts);
END;


--Exercicio PROCEDURE

CREATE OR REPLACE PROCEDURE prc_insere_produto(
p_cod_produto PRODUTO.COD_PRODUTO%type,
p_nom_produto PRODUTO.NOM_PRODUTO%type,
p_cod_barra PRODUTO.COD_BARRA%type,
p_sta_ativo PRODUTO.STA_ATIVO%type,
p_dat_cadastro PRODUTO.DAT_CADASTRO%type,
p_dat_cancelamento PRODUTO.DAT_CANCELAMENTO%type
)
IS

nome_produto EXCEPTION;

BEGIN
    IF length(p_nom_produto) < 3 and REGEXP_LIKE(p_nom_produto,'[0:9]') THEN
        RAISE nome_produto;
    ELSE
        INSERT INTO PRODUTO (COD_PRODUTO, NOM_PRODUTO, COD_BARRA, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO)
        VALUES (p_cod_produto, p_nom_produto, p_cod_barra, p_sta_ativo, p_dat_cadastro, p_dat_cancelamento);
    END IF;
EXCEPTION
    WHEN nome_produto THEN
        raise_application_error(-20015,'O nome do produto deve ter mais de 3 digitos');
END;



