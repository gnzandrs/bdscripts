SELECT owner, name, type, line, text
FROM dba_source
WHERE instr(UPPER(text), UPPER('text to search...')) > 0;
