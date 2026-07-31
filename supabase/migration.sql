-- =============================================================
-- AstroCuriosity — Supabase Migration (base existente)
-- Ajustes seguros para ambiente com tabelas e dados já criados.
-- Execute no SQL Editor: https://app.supabase.com -> SQL Editor
-- =============================================================

-- Garantir que RLS esteja habilitado na tabela existente
ALTER TABLE IF EXISTS public.celestial_objects ENABLE ROW LEVEL SECURITY;

-- Recriar policies de leitura de forma idempotente
DROP POLICY IF EXISTS "public_read" ON public.celestial_objects;
CREATE POLICY "public_read" ON public.celestial_objects
  FOR SELECT TO anon
  USING (true);

DROP POLICY IF EXISTS "authenticated_read" ON public.celestial_objects;
CREATE POLICY "authenticated_read" ON public.celestial_objects
  FOR SELECT TO authenticated
  USING (true);

-- Este script NAO cria tabela e NAO insere dados.
