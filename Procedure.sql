select * from aluno;

declare
    vRA number :=&ra;
    vNome varchar2(30) := '&nome';
begin 
    insert into aluno values( 
        vRA,
        vNome
    );
    COMMIT;
end;

CREATE OR REPLACE PROCEDURE PRD_INSERT_ALUNO
(P_RA ALUNO.RA%type,
P_NOME ALUNO.nome%type)
IS
BEGIN
    INSERT INTO ALUNO VALUES(
    p_ra,
    p_nome);
    
    COMMIT;
END;

CALL prd_insert_aluno(1313,'Julinha');
EXECUTE prd_insert_aluno(1212, 'Jão');
EXEC prd_insert_aluno(2121, 'PROFESSOR');

BEGIN
pf1788.prd_insert_aluno(3434, 'Leozin');
END;


CREATE OR REPLACE PROCEDURE prd_update_aluno(
    p_ra aluno.ra%type,
    p_nome aluno.nome%type)
IS
BEGIN
    UPDATE ALUNO
    SET
        NOME = p_nome
    WHERE
        RA = p_ra;
    COMMIT;
END;

EXECUTE prd_update_aluno(1111, 'Julinha Gay');

CREATE OR REPLACE PROCEDURE prd_delete_aluno(
    p_ra aluno.ra%type)
IS
BEGIN
    DELETE FROM ALUNO WHERE RA = p_ra;
    COMMIT;
END;

select * from tabela_vendas;


CREATE OR REPLACE PROCEDURE prd_delete_may IS
    contador NUMBER := 0;
BEGIN
    FOR x IN (
        SELECT
            *
        FROM
            tabela_vendas
    ) LOOP
        DELETE FROM tabela_vendas
        WHERE
            ordernumber = x.ordernumber;
 
        IF MOD(contador, 200) = 0 THEN
            COMMIT;
        END IF;
        contador := contador + 1;
    END LOOP;
END;
    

CREATE OR REPLACE PROCEDURE prd_insert_pedido(

    p_cod_pedido pedido.cod_pedido%type,
    p_cod_pedido_relacionado pedido.cod_pedido_relacionado%type,
    p_cod_cliente pedido.cod_cliente%type,
    p_cod_usuario pedido.cod_usuario%type ,
    p_cod_vendedor pedido.cod_vendedor%type ,
    p_dat_pedido pedido.dat_pedido%type,
    p_dat_cancelamento pedido.dat_cancelamento%type,
    p_dat_entrega pedido.dat_entrega%type,
    p_val_total_pedido pedido.val_total_pedido%type ,
    p_val_desconto pedido.val_desconto%type,
    p_seq_endereco_cliente pedido.seq_endereco_cliente%type,
    p_status pedido.status%type)
IS
BEGIN
    INSERT INTO pedido VALUES(
    p_cod_pedido,
    p_cod_pedido_relacionado,
    p_cod_cliente,
    p_cod_usuario,
    p_cod_vendedor,
    p_dat_pedido,
    p_dat_cancelamento,
    p_dat_entrega,
    p_val_total_pedido,
    p_val_desconto,
    p_seq_endereco_cliente,
    p_status);
    
    COMMIT;
END;

    
    
    
    
    