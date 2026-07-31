-- =============================================================
-- AstroCuriosity — Admin Policy (base existente)
-- Permite escrita apenas para usuarios autenticados com claim admin.
-- =============================================================

-- Garantir que RLS esteja habilitado na tabela existente
ALTER TABLE IF EXISTS public.celestial_objects ENABLE ROW LEVEL SECURITY;

-- Recriar policy admin_write de forma idempotente
DROP POLICY IF EXISTS "admin_write" ON public.celestial_objects;
CREATE POLICY "admin_write" ON public.celestial_objects
  FOR ALL TO authenticated
  USING (
    COALESCE((auth.jwt() -> 'app_metadata' ->> 'is_admin')::boolean, false)
  )
  WITH CHECK (
    COALESCE((auth.jwt() -> 'app_metadata' ->> 'is_admin')::boolean, false)
  );
