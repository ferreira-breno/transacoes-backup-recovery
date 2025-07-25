# Projeto: Gerenciamento de Transações e Backup MySQL

## Parte 1 - Transações Simples
- Desabilitação do autocommit para controle manual.
- Exemplo de transação com commit e rollback.

## Parte 2 - Transações com Procedure
- Procedure com controle de erro utilizando handler.
- Uso de savepoint para rollback parcial.
- Exemplo de atualização com validação e controle de commit.

## Parte 3 - Backup e Recovery
- Backup completo do banco com `mysqldump` incluindo rotinas, triggers e eventos.
- Comando para recuperação do banco a partir do arquivo gerado.
- Recomenda-se backup periódico para garantir a integridade dos dados.

---

## Como executar

1. Configure seu usuário e senha no MySQL.
2. Execute os scripts SQL para criação e testes das transações:
   - `transacoes_simples.sql`
   - `procedure_transacao.sql`
3. Realize o backup via terminal com o comando:
   ```bash
   mysqldump -u seu_usuario -p --routines --events --triggers e_commerce > backup_ecommerce.sql
   ```
4. Para restaurar o banco:
   ```bash
   mysql -u seu_usuario -p e_commerce < backup_ecommerce.sql
   ```
5. Armazene o backup e os scripts no repositório para controle de versões.

# Backup e Restore do Banco de Dados e_commerce

Este repositório contém um script bash para realizar backup e restauração do banco de dados MySQL `e_commerce`, incluindo dados, procedures, eventos e triggers.

## Uso

1. Garanta que o MySQL esteja instalado e configurado no seu sistema.
2. Edite o script `backup_restore.sh` se quiser alterar o usuário padrão.
3. Execute o script:

```bash
chmod +x backup_restore.sh
./backup_restore.sh

