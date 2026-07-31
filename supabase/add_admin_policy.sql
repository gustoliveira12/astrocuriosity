-- Execute no SQL Editor do Supabase para permitir
-- que somente usuários com app_metadata.is_admin = true
-- possam inserir, editar e remover objetos.

DROP POLICY IF EXISTS "admin_write" ON celestial_objects;

CREATE POLICY "admin_write" ON celestial_objects
  FOR ALL TO authenticated
  USING (
    COALESCE((auth.jwt() -> 'app_metadata' ->> 'is_admin')::boolean, false)
  )
  WITH CHECK (
    COALESCE((auth.jwt() -> 'app_metadata' ->> 'is_admin')::boolean, false)
  );
