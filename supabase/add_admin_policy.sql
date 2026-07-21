-- Execute no SQL Editor do Supabase para permitir
-- que o admin (usuário autenticado) insira, edite e remova objetos.

CREATE POLICY "admin_write" ON celestial_objects
  FOR ALL TO authenticated
  USING (true)
  WITH CHECK (true);
