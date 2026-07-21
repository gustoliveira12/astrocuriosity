import CelestialCard from './CelestialCard'

function SkeletonCard() {
  return (
    <div className="bg-slate-800/50 rounded-xl overflow-hidden animate-pulse">
      <div className="h-44 bg-slate-700/60" />
      <div className="p-4 space-y-2">
        <div className="h-4 bg-slate-700/60 rounded w-3/4" />
        <div className="h-3 bg-slate-700/60 rounded w-full" />
        <div className="h-3 bg-slate-700/60 rounded w-5/6" />
      </div>
    </div>
  )
}

export default function CelestialGrid({ results, loading, error, onSelect }) {
  if (loading) {
    return (
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {Array.from({ length: 8 }).map((_, i) => <SkeletonCard key={i} />)}
      </div>
    )
  }

  if (error) {
    return (
      <div className="text-center py-24 max-w-md mx-auto">
        <p className="text-red-400 text-lg font-medium mb-3">⚠ Erro ao carregar dados</p>
        <p className="text-slate-400 text-sm leading-relaxed">{error}</p>
        <div className="mt-4 bg-slate-800/60 rounded-xl p-4 text-left text-xs text-slate-400 space-y-1">
          <p>1. Copie <code className="text-sky-400">.env.example</code> para <code className="text-sky-400">.env</code></p>
          <p>2. Preencha <code className="text-sky-400">VITE_SUPABASE_URL</code> e <code className="text-sky-400">VITE_SUPABASE_ANON_KEY</code></p>
          <p>3. Execute <code className="text-sky-400">supabase/migration.sql</code> no SQL Editor do Supabase</p>
          <p>4. Reinicie o servidor de desenvolvimento</p>
        </div>
      </div>
    )
  }

  if (results.length === 0) {
    return (
      <div className="text-center py-24">
        <p className="text-slate-400 text-xl">Nenhum objeto encontrado</p>
        <p className="text-slate-600 mt-2 text-sm">Tente um termo diferente ou outra categoria</p>
      </div>
    )
  }

  return (
    <div>
      <p className="text-slate-500 text-sm mb-4">
        {results.length} objeto{results.length !== 1 ? 's' : ''} encontrado{results.length !== 1 ? 's' : ''}
      </p>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {results.map(obj => (
          <CelestialCard key={obj.id} object={obj} onSelect={onSelect} />
        ))}
      </div>
    </div>
  )
}
