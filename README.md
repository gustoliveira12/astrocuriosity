# AstroCuriosity

![astrocuriosity_logo](https://github.com/user-attachments/assets/00a7a966-560f-4b85-b689-262e00b84731)

Explore o universo! Pesquise planetas, estrelas, galáxias, nebulosas e muito mais — com filtros por categoria e detalhes completos de cada objeto celeste.

## Tecnologias

- **React + Vite** — interface moderna e rápida
- **Tailwind CSS v4** — estilização utilitária
- **Supabase** — banco de dados PostgreSQL com API REST

## Estrutura

```text
src/
  App.jsx               # estado global e integração com Supabase
  lib/supabase.js       # cliente Supabase
  components/
    Header.jsx
    SearchBar.jsx       # busca em tempo real
    FilterBar.jsx       # chips de categoria
    CelestialCard.jsx   # card do objeto
    CelestialGrid.jsx   # grid responsivo + skeleton loading
    CelestialModal.jsx  # modal de detalhes
    Footer.jsx
public/
  images/               # imagens dos objetos celestes
  favicon/
supabase/
  migration.sql         # ajustes de RLS/policies (sem seed)
  add_admin_policy.sql  # policy de escrita para admin
```

## Setup do Supabase

1. Execute [supabase/migration.sql](supabase/migration.sql) no SQL Editor (script para base existente).
2. Execute [supabase/add_admin_policy.sql](supabase/add_admin_policy.sql) para habilitar escrita administrativa.
3. No Supabase Auth, marque o usuário admin com app_metadata.is_admin = true.

---

Projeto iniciado durante a Imersão Dev com Google Gemini da Alura (Setembro 2024) e evoluído para React + Supabase em 2026.
