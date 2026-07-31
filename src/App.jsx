import { useState, useEffect, useMemo } from 'react'
import { supabase, isConfigured } from './lib/supabase'
import Header from './components/Header'
import SearchBar from './components/SearchBar'
import FilterBar from './components/FilterBar'
import CelestialGrid from './components/CelestialGrid'
import CelestialModal from './components/CelestialModal'
import Footer from './components/Footer'

export const CATEGORIES = [
  { label: 'Todos',          keywords: [] },
  { label: 'Buracos Negros', keywords: ['buraco negro'] },
  { label: 'Galáxias',       keywords: ['galáxia', 'galaxia'] },
  { label: 'Estrelas',       keywords: ['estrela'] },
  { label: 'Planetas',       keywords: ['planeta', 'gigante gasoso', 'gigante de gelo'] },
  { label: 'Cometas',        keywords: ['cometa'] },
  { label: 'Luas',           keywords: ['satélite natural', 'satelite natural'] },
  { label: 'Nebulosas',      keywords: ['nebulosa'] },
  { label: 'Telescópios',    keywords: ['telescópio', 'telescopio'] },
]

export default function App() {
  const [allObjects, setAllObjects]     = useState([])
  const [query, setQuery]               = useState('')
  const [activeCategory, setCategory]   = useState('Todos')
  const [loading, setLoading]           = useState(true)
  const [error, setError]               = useState(null)
  const [selected, setSelected]         = useState(null)

  useEffect(() => {
    if (!isConfigured) {
      setError('Supabase não configurado. Copie .env.example para .env e preencha suas credenciais.')
      setLoading(false)
      return
    }

    async function fetchAll() {
      setLoading(true)
      try {
        const { data, error } = await supabase
          .from('celestial_objects')
          .select('*')
          .order('titulo')
        if (error) throw error
        setAllObjects(data ?? [])
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }
    fetchAll()
  }, [])

  const filtered = useMemo(() => {
    const cat = CATEGORIES.find(c => c.label === activeCategory)

    return allObjects.filter(obj => {
      const tipo = obj.tipo?.toLowerCase() ?? ''

      // Category filter
      if (cat && cat.keywords.length > 0) {
        if (!cat.keywords.some(kw => tipo.includes(kw))) return false
      }

      // Text search
      if (query.trim()) {
        const q = query.toLowerCase()
        return (
          obj.titulo?.toLowerCase().includes(q) ||
          obj.descricao?.toLowerCase().includes(q) ||
          obj.tags?.toLowerCase().includes(q) ||
          obj.caracteristicas?.toLowerCase().includes(q) ||
          tipo.includes(q)
        )
      }

      return true
    })
  }, [allObjects, query, activeCategory])

  return (
    <div
      className="min-h-screen text-white flex flex-col"
      style={{
        backgroundImage: 'url(/images/background.jpg)',
        backgroundSize: 'cover',
        backgroundAttachment: 'fixed',
        backgroundPosition: 'center',
      }}
    >
      <div className="min-h-screen flex flex-col" style={{ backgroundColor: 'rgba(2, 6, 23, 0.82)' }}>
        <Header />
        <main className="flex-1 w-full max-w-7xl mx-auto px-4 pb-10">
          <SearchBar query={query} onChange={setQuery} />
          <FilterBar categories={CATEGORIES} active={activeCategory} onSelect={setCategory} />
          <CelestialGrid
            results={filtered}
            loading={loading}
            error={error}
            onSelect={setSelected}
          />
        </main>
        <Footer />
      </div>

      {selected && (
        <CelestialModal object={selected} onClose={() => setSelected(null)} />
      )}
    </div>
  )
}
