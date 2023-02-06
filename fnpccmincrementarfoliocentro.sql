-- FUNCTION: public.fnpccmincrementarfoliocentro(integer)

-- DROP FUNCTION IF EXISTS public.fnpccmincrementarfoliocentro(integer);

CREATE OR REPLACE FUNCTION public.fnpccmincrementarfoliocentro(
	integer)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100
    --VOLATILE PARALLEL UNSAFE
AS $BODY$

    UPDATE cmifolioscentros SET folio = folio+1 WHERE centro=$1;
    SELECT folio FROM cmifolioscentros WHERE centro=$1 FOR UPDATE;
$BODY$;

/*ALTER FUNCTION public.fnpccmincrementarfoliocentro(integer)
    OWNER TO syscorreoprog;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO PUBLIC;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syscorreomicrobodegam;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syscorreomicrobodegar;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syscorreomicrocredito;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syscorreomicroprog;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syscorreoprog;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO sysdescre;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO syspersonalcorreomicro;

GRANT EXECUTE ON FUNCTION public.fnpccmincrementarfoliocentro(integer) TO systdascoppel;*/

