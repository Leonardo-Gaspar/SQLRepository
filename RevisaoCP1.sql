--1.Crie um bloco anônimo que calcula o total de movimentações de estoque para um determinado produto. 
set serveroutput on;

DECLARE 
    codProduto number := &DigiteCodigoDoProduto;
    nomProduto varchar2(30);
    totalProduto number;
BEGIN
    SELECT 
        SUM(QTD_MOVIMENTACAO_ESTOQUE),
        b.nom_produto
    INTO
        totalProduto,
        nomProduto
    FROM 
        movimento_estoque A 
        JOIN produto B ON (a.cod_produto = b.cod_produto)
    WHERE
        a.cod_produto = codProduto
    GROUP BY
        b.nom_produto;
        
    dbms_output.put_line('Voce tem o total de '
                        ||totalProduto
                        || ' ' 
                        ||nomProduto
                        ||' no estoque');
END;


DECLARE
    idcliente number := &DigiteCodigoCliente;
BEGIN 
    FOR i IN(
    SELECT 
        ROUND(AVG(pd.VAL_TOTAL_PEDIDO),2) MEDIA,
        pd.cod_cliente,
        cli.nom_cliente 
    FROM 
        rm553383.PEDIDO pd 
        JOIN rm553383.CLIENTE cli ON PD.COD_CLIENTE = cli.COD_CLIENTE 
    WHERE 
        PD.COD_CLIENTE = idcliente
    GROUP BY pd.cod_cliente,
        cli.nom_cliente
    )LOOP
        dbms_output.put_line('A média total de pedidos do cliente' 
            || i.nom_cliente 
            || 'é de ' 
            || x.media);
    END LOOP;
END;

DECLARE
    staAtivo CHAR(1) := 'S'; 
    totalActiveProducts NUMBER; 
BEGIN
    SELECT COUNT(*)
    INTO totalActiveProducts
    FROM produto_composto
    WHERE sta_ativo = staAtivo;
    
    DBMS_OUTPUT.PUT_LINE('Total number of active products: ' || totalActiveProducts);
END;
    

        