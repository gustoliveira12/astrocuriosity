export default function SearchBar({ query, onChange }) {
  return (
    <div className="flex mb-6 max-w-2xl mx-auto">
      <div className="relative flex-1">
        <input
          type="text"
          value={query}
          onChange={e => onChange(e.target.value)}
          placeholder="Pesquisar objeto celeste..."
          className="w-full bg-slate-800/60 backdrop-blur-sm border border-slate-600 rounded-full px-5 py-3 pr-12 text-white placeholder-slate-400 focus:outline-none focus:border-sky-400 focus:ring-1 focus:ring-sky-400 transition-colors"
        />
        {query && (
          <button
            onClick={() => onChange('')}
            aria-label="Limpar pesquisa"
            className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 hover:text-white transition-colors text-lg leading-none"
          >
            ✕
          </button>
        )}
      </div>
    </div>
  )
}
