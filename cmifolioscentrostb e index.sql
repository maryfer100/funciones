-- Index: cmifolioscentroscentro

-- DROP INDEX IF EXISTS public.cmifolioscentroscentro;

CREATE UNIQUE INDEX IF NOT EXISTS cmifolioscentroscentro
    ON public.cmifolioscentros USING btree
    (centro ASC NULLS LAST)
    TABLESPACE pg_default;


    -- Table: public.cmifolioscentros

-- DROP TABLE IF EXISTS public.cmifolioscentros;

CREATE TABLE IF NOT EXISTS public.cmifolioscentros
(
    centro integer DEFAULT 0,
    folio integer DEFAULT 0
)

TABLESPACE pg_default;
