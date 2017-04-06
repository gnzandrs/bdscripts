declare
  vExiste CHAR(1);
begin
  select 'S'
  into vExiste
  from SYS.dba_objects
  where OBJECT_TYPE = 'INDEX'
  and upper(OBJECT_NAME) = upper('INDEX_NAME');
exception
  when others then
    vExiste := 'N';
end;

if (vExiste = 'S') then
  EXECUTE IMMEDIATE 'DROP INDEX NOMBRE_DEL_INDICE';
end if;
